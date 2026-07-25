/* efr32_app.c -- TYZS3 (EFR32MG13P732) on-chip HAL + EmberZNet glue for the
 * Kagel lock firmware. Hardware layer under the portable, host-tested cores:
 *   lock_app -> nicki_ek_lock_serial
 *
 * Integrated against Gecko SDK 4.5 (emlib + NVM3 + EmberZNet AF). Exposes
 * kagel_app_init()/kagel_app_tick() (called from main.c) and app_zb_fc00_rx()
 * (called from app.c's emberAfPreCommandReceivedCallback).
 *
 *   Cluster 0xEF00 : lock DP telemetry (Nicki_EK framing) -> ty0a01_lock_kagel.js
 *   Cluster 0xFC00 : vendor control channel (REMOTE_DP / CREATE_TEMP_PW)
 */
#include "app/framework/include/af.h"
#include "app/framework/plugin/network-steering/network-steering.h"
#include "nvm3_default.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "em_usart.h"
#include "sl_sleeptimer.h"
#include "sl_power_manager.h"
#include "lock_app.h"
#include <string.h>

/* ---- Sleepy-end-device polling (leaf stack) -------------------------------
 * A SED's radio is OFF between transactions; it RECEIVES (interview reads, the
 * mandatory TC-link-key update, remote unlock) only when it POLLS its parent.
 * Without polls z2m adds the device, then the key update + interview time out
 * and it is dropped -- "added but no function". Cadence: FAST (~5/s) while
 * joining and for 60s after the join edge (carries key exchange + interview),
 * then LONG every 2s (remote-unlock latency), none when there is no network.
 * The 2s periodic sleeptimer only WAKES the CPU (flag from ISR context; stack
 * calls are illegal there) -- the poll itself runs in the app tick. */
extern EmberStatus emberPollForData(void);
static volatile uint8_t s_poll_wake;
static sl_sleeptimer_timer_handle_t s_poll_timer;
static void poll_wake_cb(sl_sleeptimer_timer_handle_t *h, void *d) {
    (void)h; (void)d;
    s_poll_wake = 1;              /* wake only: the tick does the polling */
}

/* ---- board wiring: set from the TYZS3 datasheet (module UART pads) ---- */
#define LOCK_USART        USART0
#define LOCK_USART_CLOCK  cmuClock_USART0
#define LOCK_UART_PORT    gpioPortA          /* TYZS3 pinout CONFIRMED (Nicki_EK serial proto v20260408 p5) */
#define LOCK_TX_PIN       0                  /* module TX = PA0 -> lock MCU RX */
#define LOCK_RX_PIN       1                  /* module RX = PA1 <- lock MCU TX */
#define LOCK_UART_LOC_TX  0                  /* US0_TX LOC0 = PA0 (verified efr32mg13p_af_pins.h) */
#define LOCK_UART_LOC_RX  0                  /* US0_RX LOC0 = PA1 (staggered table; verified) */
#define LOCK_BAUD         115200             /* 115200 8N1 confirmed live on THIS MCU 2026-07-14 (NOT 9600) */

#define KAGEL_ENDPOINT     1
#define KAGEL_CLUSTER_EF00 0xEF00
#define KAGEL_CLUSTER_FC00 0xFC00
static uint8_t     g_eui64[8];
static lock_app_t  g_app;

/* ---- USART RX ring (ISR-filled, drained in kagel_app_tick) ---- */
static volatile uint8_t  rxbuf[256];
static volatile uint16_t rx_head, rx_tail;

/* Debug (SWD): is the module hearing the lock MCU over UART? */
volatile uint32_t g_dbg_uart_rx_bytes;   /* raw bytes received on PA1 from the MCU */
volatile uint8_t  g_dbg_uart_last_byte;

void USART0_RX_IRQHandler(void) {
    while (LOCK_USART->STATUS & USART_STATUS_RXDATAV) {
        uint8_t b = (uint8_t)USART_Rx(LOCK_USART);
        rxbuf[rx_head++ & 0xFF] = b;
        g_dbg_uart_rx_bytes++;
        g_dbg_uart_last_byte = b;
    }
    USART_IntClear(LOCK_USART, USART_IF_RXDATAV);
}

static void uart_init(void) {
    CMU_ClockEnable(cmuClock_GPIO, true);
    CMU_ClockEnable(LOCK_USART_CLOCK, true);
    GPIO_PinModeSet(LOCK_UART_PORT, LOCK_TX_PIN, gpioModePushPull, 1);
    GPIO_PinModeSet(LOCK_UART_PORT, LOCK_RX_PIN, gpioModeInput, 0);

    USART_InitAsync_TypeDef init = USART_INITASYNC_DEFAULT;
    init.baudrate = LOCK_BAUD;
    USART_InitAsync(LOCK_USART, &init);
    LOCK_USART->ROUTELOC0 = (LOCK_UART_LOC_TX << _USART_ROUTELOC0_TXLOC_SHIFT)
                          | (LOCK_UART_LOC_RX << _USART_ROUTELOC0_RXLOC_SHIFT);
    LOCK_USART->ROUTEPEN  = USART_ROUTEPEN_TXPEN | USART_ROUTEPEN_RXPEN;
    USART_IntEnable(LOCK_USART, USART_IF_RXDATAV);
    NVIC_EnableIRQ(USART0_RX_IRQn);
}

/* ============================ lock_app HAL ============================ */

static void hal_uart_write(const uint8_t *buf, size_t n, void *u) {
    (void)u;
    for (size_t i = 0; i < n; i++) USART_Tx(LOCK_USART, buf[i]);
}

/* Time: seeded from the coordinator's genTime, free-runs on sleeptimer. */
static uint32_t g_gmt_base, g_gmt_base_tick;
/* Debug (SWD): what we SERVE the MCU on 0x24, and how often it asks. */
volatile uint32_t g_dbg_gmt_served;
volatile uint32_t g_dbg_gmt_calls;
static uint32_t hal_gmt_now(void *u) {
    (void)u;
    uint32_t secs = (uint32_t)(sl_sleeptimer_get_tick_count64()
                    / sl_sleeptimer_get_timer_frequency());
    uint32_t g = g_gmt_base + (secs - g_gmt_base_tick);
    g_dbg_gmt_served = g;
    g_dbg_gmt_calls++;
    return g;
}
void app_set_gmt(uint32_t gmt) {
    g_gmt_base = gmt;
    g_gmt_base_tick = (uint32_t)(sl_sleeptimer_get_tick_count64()
                     / sl_sleeptimer_get_timer_frequency());
}

/* ---- time sync from the coordinator (Zigbee Time cluster 0x000A) ---------- */
/* The lock MCU timestamps records and validates time-bounded credentials
 * (temp/guest/one-time passwords, remote-unlock windows) against a clock it gets
 * ONLY from our 0x24 replies. Until this landed the module answered 0x24 with 0
 * (1970) -> every time-bounded feature failed. We read genTime from the
 * coordinator after join and feed it to the MCU. */
#define ZCL_TIME_CLUSTER_ID   0x000A
#define ZCL_TIME_ATTR_TIME    0x0000     /* UTCTime, secs since 2000-01-01 */
#define ZIGBEE_TO_UNIX_EPOCH  946684800u /* 2000-01-01 -> 1970-01-01 in secs  */

volatile uint32_t g_dbg_gmt;             /* last unix GMT applied (SWD)        */
volatile uint32_t g_dbg_gentime_resp;    /* # of genTime responses parsed      */
volatile uint32_t g_dbg_gentime_req;     /* # of genTime reads sent            */
volatile uint8_t  g_dbg_force_resync;    /* SWD-write 1 to bounce net-status   */

static void request_gentime(void) {
    uint8_t attrIds[2] = { (uint8_t)ZCL_TIME_ATTR_TIME, (uint8_t)(ZCL_TIME_ATTR_TIME >> 8) };
    emberAfFillCommandGlobalClientToServerReadAttributes(ZCL_TIME_CLUSTER_ID, attrIds, sizeof attrIds);
    emberAfSetCommandEndpoints(KAGEL_ENDPOINT, 1);
    emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, EMBER_ZIGBEE_COORDINATOR_ADDRESS);
    g_dbg_gentime_req++;
}

/* Called from app.c's emberAfReadAttributesResponseCallback with the coordinator's
 * Time-cluster reply. Sets the clock and, if it was previously unset, bounces
 * net-status so the MCU re-requests time now rather than on its slow poll. */
void app_on_gentime(uint32_t zigbee_utc) {
    if (zigbee_utc == 0 || zigbee_utc == 0xFFFFFFFFu) return;   /* coordinator clock unset */
    uint32_t unix_gmt = zigbee_utc + ZIGBEE_TO_UNIX_EPOCH;
    int was_unset = (g_gmt_base == 0);
    app_set_gmt(unix_gmt);
    g_dbg_gmt = unix_gmt;
    g_dbg_gentime_resp++;
    if (was_unset) lock_app_resync_time(&g_app);
}

/* Send a cluster-specific ZCL command (non-mfg so z2m decodes EF00 unchanged),
 * unicast to the coordinator. */
static void send_cluster(uint16_t cluster, uint8_t cmd, const uint8_t *pl, uint16_t n) {
    /* SERVER_TO_CLIENT: real Nicki_EK devices report DPs device->coordinator; z2m only
     * decodes the vendor DP cluster's reports (dataResponse 0x01) in this direction.
     * client->server made z2m tag them type 'raw' and skip its datapoint converters. */
    uint8_t fc = (ZCL_CLUSTER_SPECIFIC_COMMAND | ZCL_FRAME_CONTROL_SERVER_TO_CLIENT);
    emberAfFillExternalBuffer(fc, cluster, cmd, "b", pl, n);
    emberAfSetCommandEndpoints(KAGEL_ENDPOINT, 1);
    emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, EMBER_ZIGBEE_COORDINATOR_ADDRESS);
}

/* Zigbee EF00: Nicki_EK datapoint frame: status(1)=0, transid(1), dp(1), type(1), len(2 BE), value. */
static uint8_t g_transid;
/* Debug (SWD): DPs the MCU reported and we forwarded to the hub over EF00. */
volatile uint32_t g_dbg_dp_count;
volatile uint8_t  g_dbg_last_dp_id;
volatile uint8_t  g_dbg_last_dp_type;
volatile uint32_t g_dbg_last_dp_val;   /* first up-to-4 value bytes, big-endian */

/* Debug (SWD): the timestamp the MCU stamped its last RECORD (0x23) with = the
 * MCU's OWN clock. ~1.78e9 => real 2026 time (sync worked); ~0/tiny => still 1970. */
volatile uint32_t g_dbg_last_mcu_ts;
static void hal_zb_ef00_report(uint8_t dp_id, uint8_t type, const uint8_t *val,
                               uint16_t len, uint32_t ts, void *u) {
    (void)u;
    if (ts) g_dbg_last_mcu_ts = ts;
    g_dbg_dp_count++;
    g_dbg_last_dp_id = dp_id;
    g_dbg_last_dp_type = type;
    { uint32_t v = 0; for (uint16_t i = 0; i < len && i < 4; i++) v = (v << 8) | val[i];
      g_dbg_last_dp_val = v; }
    uint8_t p[6 + 256];
    if (len > 256) return;
    p[0] = 0x00; p[1] = g_transid++; p[2] = dp_id; p[3] = type;
    p[4] = (uint8_t)(len >> 8); p[5] = (uint8_t)len;
    if (len) memcpy(&p[6], val, len);
    send_cluster(KAGEL_CLUSTER_EF00, 0x01 /* dataReport */, p, (uint16_t)(6 + len));
}

/* Debug (SWD): ground-truth capture of the serial commands the lock MCU issues.
 * ring = last 16 cmd bytes (idx & 15 = newest slot just written); per-command
 * counters for the ones that matter for the password investigation. Read after a
 * keypad/temp/dynamic-password attempt to see EXACTLY what the MCU sent. */
volatile uint8_t  g_dbg_cmd_ring[16];
volatile uint32_t g_dbg_cmd_idx;
volatile uint32_t g_dbg_cmd07;      /* 0x07 dynamic-password verify requests   */
volatile uint32_t g_dbg_cmd08;      /* 0x08 offline-password verify requests    */
volatile uint32_t g_dbg_cmd05;      /* 0x05 DP report (status push)             */
volatile uint32_t g_dbg_cmd23;      /* 0x23 record report (unlock events)       */
volatile uint8_t  g_dbg_last_cmd;
static void hal_on_frame(uint8_t cmd, const uint8_t *data, uint16_t dlen, void *u) {
    (void)data; (void)dlen; (void)u;
    g_dbg_cmd_ring[g_dbg_cmd_idx & 15] = cmd;
    g_dbg_cmd_idx++;
    g_dbg_last_cmd = cmd;
    if (cmd == 0x07) g_dbg_cmd07++;
    else if (cmd == 0x08) g_dbg_cmd08++;
    else if (cmd == 0x05) g_dbg_cmd05++;
    else if (cmd == 0x23) g_dbg_cmd23++;
}

/* User put the lock in pairing / factory-reset (MCU 0x03). Leave the Zigbee
 * network so the stack-status callback re-steers into the open permit window --
 * a module holding stale NVM3 creds otherwise stays "joined" and never re-pairs
 * (the add-device timeout). Done via a flag: emberLeaveNetwork() must run in the
 * main-loop tick, not this serial-callback context. */
volatile uint32_t g_dbg_config_reqs;
volatile uint32_t g_dbg_pair_leaves;      /* # of user-pair leaves honored (SWD) */
volatile uint32_t g_dbg_pair_press;       /* # of pair-ceremony frames (sub 0x01/0x02) */
volatile uint8_t  g_pairing;              /* forces OFFLINE to the MCU during a re-pair */
volatile uint8_t  g_pair_left;            /* the pairing leave has actually happened */
static volatile uint8_t g_do_leave_pair;  /* set by 0x03 sub=0x01, acted in tick */
static uint32_t         g_last_pair_leave;
extern volatile uint8_t g_link_ok;        /* confirmed contact this session (app.c) */

/* ---- network-configuration (pairing) window -----------------------------------
 * Nicki_EK protocol §6.4 defines exactly THREE configure commands: 0x00 factory-reset
 * the module, 0x01 START NETWORK CONFIGURATION, 0x02 "MCU has restored factory
 * settings". There is NO "exit pairing" command -- the MCU never tells us the user
 * left the menu. The module is therefore REQUIRED to time its own pairing window
 * out, exactly like a stock Nicki_EK module (~3 min).
 *
 * We previously had NO timeout: join_wake_cb re-armed a steer every 6s forever
 * whenever unjoined. Network steering is not "rejoin my hub" -- it joins ANY
 * coordinator that permits joining, with the default TC link key. So a lock that
 * failed to pair sat hunting indefinitely and would silently join whoever opened
 * their permit window next (observed: 152 steers over 14 min, then it joined with
 * no press at all). On a door lock that is a security bug, not just untidiness.
 *
 * Two distinct situations, previously conflated into "just steer":
 *   PAIR   (user pressed / factory-fresh boot) -> steer, but only inside the window.
 *   OFFLINE(joined once, lost the parent)      -> REJOIN our own network with our
 *                                                 existing key. Never steer: losing
 *                                                 your parent is not consent to join
 *                                                 a stranger.
 * Window expiry while unjoined is a real failure: we keep reporting net-status 0x00
 * ("not connected to a gateway", §6.3) and the MCU shows "pairing failed" -- which
 * is the truthful outcome the doc describes, not something to paper over. */
/* Nicki_EK's documented default is 180s (range 30-600). We use 120s because THIS lock's
 * MCU gives up at 120s (measured by Nicki 2026-07-16, and matching the observed "lock
 * said timed out" while our radio was still scanning). Nicki_EK's 180 presumably matches
 * THEIR MCU; ours is shorter. Module and lock must stop together: a window that
 * outlives the MCU's leaves the radio offering itself for 60s AFTER the user has been
 * told pairing failed -- the same "pairing mode outliving user intent" defect, just
 * smaller. If a future lock MCU uses a different timeout, match it here. */
#define KAGEL_PAIR_WINDOW_S   120u
volatile uint32_t g_pair_window_end;      /* 0 = closed; else uptime secs deadline */
volatile uint32_t g_dbg_rejoins;          /* # of secure rejoin attempts (SWD) */

static uint32_t now_s(void) {
    return (uint32_t)(sl_sleeptimer_get_tick_count64()
                      / sl_sleeptimer_get_timer_frequency());
}
static void pair_window_open(void)  { g_pair_window_end = now_s() + KAGEL_PAIR_WINDOW_S; }
static int  pair_window_open_now(void) {
    return g_pair_window_end && now_s() < g_pair_window_end;
}
/* exposed to app.c's stack-status / steering-complete callbacks */
int kagel_pair_window_open(void) { return pair_window_open_now(); }

/* Called the moment we are actually on a network. Closing pairing is the JOIN's
 * job, not the timer's -- a joined slave must leave network-configuration mode at
 * once. Also hard-stops the steering plugin so no scan can be left in flight. */
volatile uint32_t g_dbg_pair_closes;
extern volatile uint8_t g_retry_join;      /* defined below */
void kagel_pair_window_close(void) {
    if (g_pair_window_end) g_dbg_pair_closes++;
    g_pair_window_end = 0;
    g_retry_join = 0;
    emberAfPluginNetworkSteeringStop();
}
static void hal_on_config(uint8_t sub, void *u) {
    (void)u;
    g_dbg_config_reqs++;
    /* GROUND TRUTH (dual-line capture 2026-07-16). A press is a two-frame ceremony,
     * MCU->module:  sub=0x02 (reset notify)  THEN  sub=0x01 (start pairing).
     * 0x03 appears ONLY at a press -- never spuriously, never at rest.
     * sub=0x00 is NOT a press: it is OUR OWN ack (nicki_ek_lock_serial.c sends cmd 0x03
     * payload ok=0x00 module->MCU). The old "sub=0x00 = press" note read that ack off
     * the wrong line, so this hook never fired at all.
     *
     * REPORT vs LEAVE are deliberately separated -- conflating them caused BOTH of the
     * symptoms seen on 2026-07-16:
     *  - REPORT offline on the WHOLE ceremony (0x02 and 0x01). 0x02 lands FIRST, and
     *    answering it with the stale online is the instant false "pairing successful";
     *    keying on 0x01 alone was one frame too late.
     *  - LEAVE only on 0x01, so a reset-notify alone can't drop a healthy network
     *    (the 3a8bbe8 self-pairing regression came from leaving on every 0x03).
     * The debounce must NOT gate g_pairing: a user pressing pair twice in quick
     * succession previously got no OFFLINE at all, so the MCU timed out -> "pairing
     * failed" while the module rejoined behind its back. It is now 3s -- just enough
     * to coalesce duplicate 0x01s inside ONE ceremony, never long enough to swallow a
     * second deliberate press (a 20s debounce did exactly that). EVERY genuine press
     * must leave: skipping the leave while still joined let the tick clear g_pairing
     * on the next pass -> instant ONLINE -> the false ack all over again.
     * Boot-settle (>10s) keeps a power-on config from self-pairing. */
    if (sub != 0x01 && sub != 0x02) return;
    g_dbg_pair_press++;
    uint32_t now = now_s();
    if (now < 10) return;                                   /* ignore boot-time config */
    if (sub == 0x01) pair_window_open();  /* §6.4: 0x01 = start network configuration */
    g_pairing = 1;                       /* every ceremony frame -> answer OFFLINE */
    /* Contact is no longer "confirmed" for THIS ceremony: drop g_link_ok so the tick's
     * clear-condition cannot fire before we have actually left and rejoined. Without
     * this, emberLeaveNetwork() being async means netstate still reads JOINED on the
     * same tick and the latch is wiped a millisecond after we set it. */
    g_link_ok = 0;
    g_pair_left = 0;
    if (sub != 0x01) return;             /* reset-notify: report only, never leave */
    if (g_last_pair_leave && (now - g_last_pair_leave) < 3) return;  /* coalesce dupes */
    g_last_pair_leave = now;
    g_do_leave_pair = 1;
}

/* "online" to the lock MCU = JOINED to a coordinator AND confirmed live contact
 * with it this session (g_link_ok, set in app.c). netstate==JOINED alone can be
 * STALE (creds left in NVM after the coordinator removed us) — reporting online on
 * that gave a false "pairing successful". Requiring g_link_ok kills the false
 * success; the orphan-detector below then re-steers a stale binding. */
extern volatile uint8_t g_link_ok;
extern volatile uint32_t g_tx_fail;   /* consecutive failed sends (app.c) */
/* Our device joins as a ROUTER but, once associated, emberAfNetworkState()
 * persistently reports EMBER_JOINED_NETWORK_S2S_TARGET (5) rather than plain
 * EMBER_JOINED_NETWORK (2) on this SDK. A literal `== EMBER_JOINED_NETWORK`
 * check is therefore FALSE for a live, fully-joined lock — which silently
 * disabled the announce AND the 15s gentime keepalive, so the now-quiet lock
 * stopped touching the coordinator and z2m marked it offline. Treat every
 * "joined" variant as joined. (NO_PARENT (3) is excluded — the rejoin logic
 * above owns that case.) */
static int net_is_joined(void) {
    EmberNetworkStatus s = emberAfNetworkState();
    return s == EMBER_JOINED_NETWORK
        || s == EMBER_JOINED_NETWORK_S2S_INITIATOR
        || s == EMBER_JOINED_NETWORK_S2S_TARGET;
}
static int hal_is_joined(void *u) {
    (void)u;
    /* Online if JOINED and we've had REAL contact this session (g_link_ok). We do
     * NOT gate on g_tx_fail here — a marginal-but-genuine link has occasional send
     * failures and must not flap offline. The false-success we care about is the
     * boot-with-stale-creds case, which g_link_ok already blocks; a force-removed
     * live lock is handled by the conservative leave below (many fails in a row). */
    return net_is_joined() && g_link_ok && !g_pairing;
}

/* Called from app.c's emberAfPreCommandReceivedCallback for cluster 0xFC00 --
 * the vendor control channel (REMOTE_DP / CREATE_TEMP_PW). The claim/auth
 * messages (1..6) and their chunked-reassembly + ed25519 watchdog yield were
 * removed with the anti-clone machinery (2026-07-17). NOTE the shipping control
 * path is EF00 DP writes, not this — see app_zb_ef00_rx below. */
volatile uint32_t g_dbg_fc00_rx;
void app_zb_fc00_rx(uint8_t cmd, const uint8_t *payload, uint16_t len) {
    g_dbg_fc00_rx++;
    lock_app_zb_rx(&g_app, (lock_msg_t)cmd, payload, len);
}

/* Called from app.c for cluster 0xEF00 (hub remote-DP control via z2m). */
volatile uint32_t g_dbg_ef00_rx;   /* debug (SWD): incoming remote-DP commands */
void app_zb_ef00_rx(uint8_t cmd, const uint8_t *payload, uint16_t len) {
    g_dbg_ef00_rx++;
    lock_app_ef00_rx(&g_app, cmd, payload, len);
}

/* ============================ lifecycle ============================ */

static const lock_app_hal_t APP_HAL = {
    .zb_ef00_report = hal_zb_ef00_report,
    .uart_write     = hal_uart_write,
    .gmt_now        = hal_gmt_now,
    .on_frame       = hal_on_frame,
    .on_config      = hal_on_config,
    .is_joined      = hal_is_joined,
    .user           = NULL,
};

/* Join retry is driven by the steering-COMPLETE callback (app.c): on a failed
 * steer it sets g_retry_join and kagel_app_tick starts a fresh steer. Retrying
 * only AFTER a full steer completes means we never interrupt an in-progress
 * join. (The earlier periodic 15s Stop+Start aborted joins mid-flight -> flaky.) */
volatile uint8_t g_retry_join;

/* Status of the forced Basic-identity writes (read over SWD). 0x00 = SUCCESS;
 * 0x86 = UNSUPPORTED_ATTRIBUTE (attr not declared in ZAP on this endpoint). */
volatile uint8_t g_dbg_mfg_wr   = 0xEE;
volatile uint8_t g_dbg_model_wr = 0xEE;

/* Periodic wake so join RETRIES actually run. While unjoined (NO_NETWORK) there is
 * no radio traffic to wake the power-managed super-loop, so the retry poll in
 * kagel_app_tick never fires -- the module tries to join ONCE at boot and, if it
 * misses the permit window, sleeps forever (the add-device timeout). This timer's
 * interrupt wakes the loop every few seconds and re-arms the retry until we join.
 * It only sets the flag when unjoined; the tick's NO_NETWORK + 5s-spacing guards
 * keep it from disturbing an in-progress or established join. */
static int net_is_joined(void);   /* joined incl. the S2S_TARGET variant (see below) */
static sl_sleeptimer_timer_handle_t s_join_wake_timer;
static void join_wake_cb(sl_sleeptimer_timer_handle_t *h, void *d) {
    (void)h; (void)d;
    /* Only re-arm a STEER while the pairing window is genuinely open. Outside it we
     * stay dormant: an unpaired lock must not keep offering itself to any coordinator
     * that opens a permit window (it used to do exactly that, forever). The lost-parent
     * case is handled by the rejoin path in the tick, not here. */
    if (!net_is_joined() && pair_window_open_now())
        g_retry_join = 1;
}

void kagel_app_init(void) {
    /* Keep the CPU out of EM2 so the super-loop keeps running. */
    sl_power_manager_add_em_requirement(SL_POWER_MANAGER_EM1);

    emberAfGetEui64(g_eui64);
    uart_init();
    lock_app_init(&g_app, &APP_HAL);
    lock_app_start(&g_app);          /* product-info query; gate stays CLOSED */

    /* Force-serve the Basic identity so z2m's interview always reads it (the ZAP
     * RAM defaults read back empty). ZCL char strings are length-prefixed;
     * cluster 0x0000 Basic, attr 0x0004 mfrName / 0x0005 modelId, type 0x42 string. */
    static const uint8_t s_mfg[]   = {13,'S','m','a','r','t','H','o','m','e','P','l','u','s'};
    static const uint8_t s_model[] = {9,'L','C','K','-','B','I','4','0','0'};
    g_dbg_mfg_wr   = (uint8_t)emberAfWriteServerAttribute(KAGEL_ENDPOINT, 0x0000, 0x0004, (uint8_t *)s_mfg,   0x42);
    g_dbg_model_wr = (uint8_t)emberAfWriteServerAttribute(KAGEL_ENDPOINT, 0x0000, 0x0005, (uint8_t *)s_model, 0x42);

    /* BOOT NEVER OPENS A PAIRING WINDOW. Only a deliberate user press (MCU 0x03
     * sub=0x01) does -- see hal_on_config.
     *
     * This used to open one 120s window when it came up with no NVM3 creds, copying a
     * stock module's "factory-fresh pairs on first power-up". On a DOOR LOCK that is
     * the wrong default: it means a power event that finds the module credential-less
     * puts it in pairing mode with nobody touching it, silently offering itself to any
     * coordinator with an open permit window. Nicki hit exactly that on a hard power
     * reset after a flash (2026-07-17) -- the erase wipes the creds, so every reboot
     * until it joins was a fresh unattended pairing window.
     *
     * A credential-less module now sits INERT until someone physically presses pair.
     * Cost: after a factory flash the installer must press pair once. That is the
     * correct trade for a lock -- pairing should require human intent, always.
     * (A module that still HOLDS creds never steered at boot anyway; it rejoins its
     * own network -- verified by the power-cycle test, 2026-07-17.) */

    /* Wake the loop every 6s so join retries fire even with no radio traffic to
     * wake it (the fix for the "joins once at boot then stalls" add-device timeout). */
    sl_sleeptimer_start_periodic_timer_ms(&s_join_wake_timer, 6000,
                                           join_wake_cb, NULL, 0, 0);

    /* Wake the loop every 2s for the SED long poll (see poll block in the tick). */
    sl_sleeptimer_start_periodic_timer_ms(&s_poll_timer, 2000,
                                           poll_wake_cb, NULL, 0, 0);
}

/* --- debug telemetry, read over SWD (resolve addresses from the .axf) --- */
volatile uint32_t g_dbg_ticks;        /* increments every tick (is the loop live?) */
volatile uint32_t g_dbg_steer_calls;  /* how many times we called steering */
volatile int32_t  g_dbg_steer_rc = -999;  /* last steering start rc (0=OK) */
volatile int32_t  g_dbg_steer_first_rc = -999; /* FIRST steering start rc (0=started) */
volatile uint8_t  g_dbg_netstate = 0xEE;  /* last emberAfNetworkState() */

/* Debug (SWD): anti-clone gate state. bound=persisted claim; online=bound+authed
 * this session (gate OPEN -> MCU told 0x03). Proves a claim opened the gate. */
volatile uint8_t g_dbg_bound;
volatile uint8_t g_dbg_online;
volatile uint32_t g_dbg_announce_calls;  /* # of net-status "online" pushes to the MCU */

void kagel_app_tick(void) {
    g_dbg_ticks++;
    g_dbg_netstate = (uint8_t)emberAfNetworkState();
    g_dbg_online = (uint8_t)lock_app_is_online(&g_app);
    tls_pending_tick(&g_app.tls);   /* retry wakeup-verified command sends */

    /* ── SED polling (rationale at poll_wake_cb above). State-gated: poll ONLY while
     * JOINING (1) or JOINED (2) — polling with no parent hangs the MAC. FAST ~200ms
     * while joining + 60s post-join (TC-key update + z2m interview), LONG 2s after
     * (each s_poll_wake from the periodic timer), none unjoined. ── */
    {
        EmberNetworkStatus st = emberAfNetworkState();
        if (st == EMBER_JOINING_NETWORK || st == EMBER_JOINED_NETWORK) {
            static uint32_t s_joined_edge;             /* uptime secs of the join edge */
            if (st == EMBER_JOINED_NETWORK) { if (!s_joined_edge) s_joined_edge = now_s(); }
            else s_joined_edge = 0;
            int fast = (st == EMBER_JOINING_NETWORK)
                    || (s_joined_edge && (now_s() - s_joined_edge) < 60);
            if (fast) {
                static uint32_t s_next_fast;           /* sleeptimer ticks */
                uint32_t nt = sl_sleeptimer_get_tick_count();
                if ((int32_t)(nt - s_next_fast) >= 0) {
                    s_next_fast = nt + sl_sleeptimer_ms_to_tick(200);
                    emberPollForData();
                }
            } else if (s_poll_wake) {
                s_poll_wake = 0;
                emberPollForData();
            }
        } else {
            s_poll_wake = 0;
        }
    }

    /* User pressed pair (MCU 0x03 sub=0x01): leave the network so we re-steer and
     * rejoin fresh — a device told to pair always re-pairs, whatever its state. */
    if (g_do_leave_pair) {
        g_do_leave_pair = 0;
        g_dbg_pair_leaves++;
        emberLeaveNetwork();
        g_pair_left = 1;                 /* the leave is now in flight -> latch may clear */
        g_retry_join = 1;
    }
    /* Re-pair done: clear the latch ONLY after the leave actually happened AND we have
     * genuinely rejoined (fresh contact -> g_link_ok). Checking JOINED+g_link_ok alone
     * cleared it instantly — emberLeaveNetwork() is async, so netstate still reads
     * JOINED on this same tick, and on a debounced press we never left at all. Either
     * way the module snapped back to ONLINE and the MCU declared a false success. */
    if (g_pairing && g_pair_left
        && net_is_joined() && g_link_ok) {
        g_pairing = 0;
        g_pair_left = 0;
    }

    /* Retry flagged (boot, or a prior steer completed without joining): start a
     * fresh scan, but SPACED >=5s apart so the radio settles between scans
     * (rapid back-to-back steers produced NO_BEACONS). Never runs mid-join
     * because the flag is only set after a full steer completes. */
    if (g_retry_join) {
        uint32_t now = now_s();
        static uint32_t s_next_steer_ok;
        /* Steering is PAIRING -- it joins whoever permits, with the default TC key.
         * Gate it on the window so an unpaired lock goes dormant instead of hunting
         * forever (see the pairing-window note above). */
        if (!pair_window_open_now()) {
            g_retry_join = 0;
        } else if (now >= s_next_steer_ok && emberAfNetworkState() == EMBER_NO_NETWORK) {
            g_retry_join = 0;
            s_next_steer_ok = now + 5;
            emberAfPluginNetworkSteeringStop();
            g_dbg_steer_rc = (int32_t)emberAfPluginNetworkSteeringStart();
            if (g_dbg_steer_calls == 0) g_dbg_steer_first_rc = g_dbg_steer_rc;
            g_dbg_steer_calls++;
        }
    }

    /* Lost our parent but we still hold network creds: REJOIN our own network with
     * our existing key. This is the "offline" case from §6.3, NOT pairing -- it must
     * never fall through to steering, or a lock that merely lost its hub would offer
     * itself to any coordinator with an open permit window. Spaced 10s; the stack
     * reports the outcome via the usual stack-status path. */
    if (emberAfNetworkState() == EMBER_JOINED_NETWORK_NO_PARENT) {
        static uint32_t s_next_rejoin_ok;
        uint32_t now = now_s();
        if (now >= s_next_rejoin_ok) {
            s_next_rejoin_ok = now + 10;
            g_dbg_rejoins++;
            emberFindAndRejoinNetwork(true, 0);   /* true = keep current network key */
        }
    }

    /* Once joined, proactively announce net-status "online" to the lock MCU so it
     * begins streaming DP reports. The MCU waits for the module to push this (real
     * Nicki_EK modules do it unprompted); without it the MCU stays provisioned-but-
     * offline and never reports unlock events even though the gate is open.
     * Re-asserted every ~3s: covers the MCU booting after the module, and serves
     * as the connection keep-alive. Gated inside lock_app on the anti-clone gate,
     * so a claim-gated build stays silent until a valid claim opens it. */
    /* SWD bench hook: write g_dbg_force_resync=1 (after SWD-setting g_gmt_base)
     * to bounce net-status and make the MCU re-request time immediately. */
    if (g_dbg_force_resync) { g_dbg_force_resync = 0; lock_app_resync_time(&g_app); }

    static uint8_t s_announced;   /* one-shot: announce online on the join EDGE only */
    if (!net_is_joined()) s_announced = 0;
    if (net_is_joined()) {
        uint32_t now = (uint32_t)(sl_sleeptimer_get_tick_count64()
                       / sl_sleeptimer_get_timer_frequency());
        /* Announce "online" ONCE per join. Do NOT re-push on a timer: a real module
         * reports net-status on CHANGE and answers the MCU's own net-status query
         * (handled in the serial core), it does not heartbeat "still online" every
         * few seconds. The old 3s re-announce woke the battery MCU constantly AND
         * made it re-request time on each push -> the UART flood Nicki saw. One-shot
         * on the join edge is what the MCU actually needs. */
        if (!s_announced) {
            s_announced = 1;
            lock_app_announce_online(&g_app);
            g_dbg_announce_calls++;
        }

        /* Read genTime from the coordinator until we have a clock, then refresh
         * daily for drift. Cheap unicast read; app_on_gentime applies the reply. */
        static uint32_t s_next_gentime;
        if (now >= s_next_gentime) {
            s_next_gentime = now + 15;   /* clock refresh + reachability probe: a stale
                                          * binding's read fails -> g_tx_fail climbs */
            request_gentime();
        }

        /* Stale-binding leave — LAST RESORT only. Fires only after MANY consecutive
         * failed sends with ZERO successes in between (g_tx_fail resets to 0 on any
         * success), i.e. a genuinely dead binding (force-removed / gone), not a
         * marginal link (which lands the odd packet and resets). High threshold so a
         * real-but-weak join is never torn down; the coordinator's own leave (a normal
         * z2m remove) is the fast path. ~30 * 15s probe ≈ 7 min of total silence. */
        if (g_tx_fail >= 30) {
            g_tx_fail = 0;
            emberLeaveNetwork();
            g_retry_join = 1;
        }


    }

    while (rx_tail != rx_head) {
        uint8_t b = rxbuf[rx_tail++ & 0xFF];
        lock_app_uart_rx(&g_app, &b, 1);
    }
}
