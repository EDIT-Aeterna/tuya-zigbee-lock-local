/* lock_app.c -- see lock_app.h. Portable, no hardware/SDK deps. */
#include "lock_app.h"
#include <string.h>

/* The nicki_ek serial core's uart_write/on_dp_report callbacks carry no user
 * pointer, so they resolve the owning app through this single-instance pointer.
 * Firmware runs exactly one lock_app; host tests use one per test. It is set at
 * init and re-asserted on every entry point below, so it is always current. */
static lock_app_t *g_active_app;

static lock_app_t *app_of(void *user) { return (lock_app_t *)user; }

static uint32_t rd32(const uint8_t *p) {
    return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8)  |  (uint32_t)p[3];
}

/* ---- serial-core HAL shims ------------------------------------------------ */
static void core_uart_write(const uint8_t *buf, size_t n) {
    lock_app_t *a = g_active_app;
    if (a && a->hal.uart_write) a->hal.uart_write(buf, n, a->hal.user);
}
static void core_on_dp(const tls_dp_t *dp, uint32_t ts) {
    lock_app_t *a = g_active_app;
    if (a && a->hal.zb_ef00_report)
        a->hal.zb_ef00_report(dp->id, dp->type, dp->value, dp->len, ts, a->hal.user);
}
static uint32_t core_gmt(void) {
    lock_app_t *a = g_active_app;
    return (a && a->hal.gmt_now) ? a->hal.gmt_now(a->hal.user) : 0;
}
static void core_on_frame(uint8_t cmd, const uint8_t *data, uint16_t dlen, void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.on_frame) a->hal.on_frame(cmd, data, dlen, a->hal.user);
}
static void core_on_unhandled(uint8_t cmd, void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.on_unhandled) a->hal.on_unhandled(cmd, a->hal.user);
}
static void core_on_config(uint8_t sub, void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.on_config) a->hal.on_config(sub, a->hal.user);
}
/* TARGET_SRPTWVAK deployment: mainland China, UTC+8, no DST. */
static int32_t core_tz(void) { return 28800; }

/* ANTI-CLONE REMOVED 2026-07-15 (Nicki): the lock is an OPEN, standard Zigbee
 * device. Kagel flashes the firmware itself, so there is no Kagel-claim gate --
 * the lock works on ANY coordinator (z2m / ZHA / deCONZ). "online" (told to the
 * lock MCU so it completes pairing + streams) now simply means the module is
 * JOINED to a coordinator, reported via the is_joined HAL hook. The claim/auth
 * and FC00 handshake machinery below is now INERT (kept to avoid churn; safe to
 * strip in a follow-up to reclaim flash). */
volatile int g_dbg_force_online;   /* retained (unused) for existing SWD/tooling refs */
static bool core_is_online(void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.is_joined) return a->hal.is_joined(a->hal.user) != 0;
    return true;   /* no join hook (host tests) -> always online */
}

/* ---- writable-DP allowlist -------------------------------------------------
 * From the AUTHORITATIVE per-PID Nicki_EK shadow (2026-07-15, 38 DPs). Hub-side
 * remote control may only push these DPs with these exact types; anything else
 * (read-only DPs like door/battery/unlock events, DPs this PID doesn't have,
 * wrong types) is DROPPED before it reaches the lock MCU. Defense-in-depth on
 * top of the auth gate: even an authed hub session can't poke arbitrary DPs. */
static const struct { uint8_t id, type; } DP_WRITABLE[] = {
    {21, TLS_DP_RAW},    /* remote_unlock: 6-digit ASCII password            */
    {23, TLS_DP_BOOL},   /* remote_unlock_switch                             */
    {24, TLS_DP_RAW},    /* password_creat                                   */
    {25, TLS_DP_RAW},    /* password_delete                                  */
    {26, TLS_DP_RAW},    /* password_update                                  */
    {27, TLS_DP_RAW},    /* password_disable (freeze)                        */
    {28, TLS_DP_RAW},    /* password_enable (unfreeze)                       */
    {39, TLS_DP_RAW},    /* password_reset (clear temp passwords)            */
    {48, TLS_DP_RAW},    /* remote_no_pd_setkey                              */
    {49, TLS_DP_RAW},    /* remote_no_dp_key (password-free remote unlock)   */
    {54, TLS_DP_RAW},    /* unlock_method_create                             */
    {55, TLS_DP_RAW},    /* unlock_method_delete                             */
    {58, TLS_DP_RAW},    /* update_all_finger                                */
    {59, TLS_DP_RAW},    /* update_all_password                              */
    {60, TLS_DP_RAW},    /* update_all_card                                  */
    {68, TLS_DP_RAW},    /* unlock_offline_pd                                */
    {69, TLS_DP_RAW},    /* unlock_offline_clear                             */
    {70, TLS_DP_RAW},    /* unlock_offline_clear_single                      */
    {93, TLS_DP_RAW},    /* update_all_face                                  */
};

static int dp_write_allowed(uint8_t dp, uint8_t type) {
    for (size_t i = 0; i < sizeof DP_WRITABLE / sizeof DP_WRITABLE[0]; i++)
        if (DP_WRITABLE[i].id == dp) return DP_WRITABLE[i].type == type;
    return 0;
}

void lock_app_init(lock_app_t *a, const lock_app_hal_t *hal) {
    memset(a, 0, sizeof(*a));
    a->hal = *hal;
    g_active_app = a;

    tls_hal_t th;
    memset(&th, 0, sizeof th);
    th.uart_write   = core_uart_write;
    th.gmt_now      = core_gmt;
    th.tz_offset    = core_tz;
    th.on_dp_report = core_on_dp;
    th.is_online    = core_is_online;
    th.on_frame     = core_on_frame;
    th.on_unhandled = core_on_unhandled;
    th.on_config    = core_on_config;
    th.user         = a;
    tls_init(&a->tls, &th);
}

void lock_app_start(lock_app_t *a) {
    g_active_app = a;
    tls_request_product_info(&a->tls);   /* stock module's first move; gate stays closed */
}

void lock_app_uart_rx(lock_app_t *a, const uint8_t *bytes, size_t n) {
    g_active_app = a;
    tls_rx_feed(&a->tls, bytes, n);
}

void lock_app_announce_online(lock_app_t *a) {
    g_active_app = a;
    /* tls_announce_online() reports GW_AND_SERVER unconditionally, so this guard is
     * what stops an unjoined module telling the MCU it is provisioned -- the false
     * "pairing successful" bug. Online == joined to a coordinator. */
    if (core_is_online(a)) tls_announce_online(&a->tls);
}

void lock_app_resync_time(lock_app_t *a) {
    g_active_app = a;
    /* Bounce net-status offline->online so the lock MCU re-runs its post-connect
     * sync -- which includes a fresh 0x24 time request. Used when the module's
     * clock has just been set (e.g. genTime arrived after the MCU already cached
     * an old/zero time): without this the MCU keeps the stale clock until its
     * slow periodic poll, and time-bounded credentials (temp/guest/one-time
     * passwords, remote-unlock validity) stay broken. No-op while offline. */
    if (!core_is_online(a)) return;
    tls_report_net_status(&a->tls, TLS_NET_NO_GW);
    tls_report_net_status(&a->tls, TLS_NET_GW_AND_SERVER);
}

void lock_app_zb_rx(lock_app_t *a, lock_msg_t type, const uint8_t *buf, size_t len) {
    g_active_app = a;
    switch (type) {

    case LOCK_MSG_REMOTE_DP: {
        if (!core_is_online(a)) return;                   /* only when joined */
        if (len < 4) return;
        uint8_t dp_id = buf[0], t = buf[1];
        uint16_t vlen = (uint16_t)((buf[2] << 8) | buf[3]);
        if (4 + (size_t)vlen > len) return;
        if (!dp_write_allowed(dp_id, t)) return;          /* per-PID DP table */
        tls_send_dp(&a->tls, dp_id, (tls_dp_type_t)t, buf + 4, vlen);
        break;
    }

    case LOCK_MSG_CREATE_TEMP_PW: {
        if (!core_is_online(a)) return;                   /* only when joined */
        if (len < 12) return;
        uint16_t pw_id   = (uint16_t)((buf[0] << 8) | buf[1]);
        uint32_t vfrom   = rd32(buf + 2);
        uint32_t vsecs   = rd32(buf + 6);
        uint8_t  onetime = buf[10];
        uint8_t  pwlen   = buf[11];
        if (12 + (size_t)pwlen > len) return;
        lock_app_create_temp_pw(a, pw_id, vfrom, vsecs, onetime, buf + 12, pwlen);
        break;
    }

    default:
        break;   /* retired claim/auth values (1..6) and anything unknown */
    }
}

/* Hub remote control over EF00 (z2m's datapoint converters -> dataRequest 0x00 /
 * sendData 0x04). Payload = seq(2 BE) followed by one or more DP units
 * [dp(1) | type(1) | len(2 BE) | value]. Forward each to the MCU via 0x04, but
 * ONLY when the module is online (joined to a coordinator). */
void lock_app_ef00_rx(lock_app_t *a, uint8_t cmd, const uint8_t *buf, size_t len) {
    g_active_app = a;
    if (cmd != 0x00 && cmd != 0x04) return;
    if (!core_is_online(a)) return;
    if (len < 2) return;
    const uint8_t *p = buf + 2;                 /* skip seq(2) */
    size_t rem = len - 2;
    while (rem >= 4) {
        uint8_t dp = p[0], type = p[1];
        uint16_t vlen = (uint16_t)((p[2] << 8) | p[3]);
        if ((size_t)4 + vlen > rem) break;
        if (dp == 200)                                    /* 200 = hub "push time" trigger, not a real lock DP */
            lock_app_resync_time(a);                      /* bounce net-status -> MCU re-requests + re-adopts time now */
        else if (dp_write_allowed(dp, type))              /* per-PID DP table */
            tls_send_dp(&a->tls, dp, (tls_dp_type_t)type, p + 4, vlen);
        p += 4 + vlen; rem -= 4 + vlen;
    }
}

int lock_app_create_temp_pw(lock_app_t *a, uint16_t pw_id, uint32_t valid_from,
                            uint32_t valid_secs, uint8_t onetime,
                            const uint8_t *pw, uint8_t pwlen) {
    g_active_app = a;
    if (!core_is_online(a)) return 0;                 /* only when joined */
    if (!dp_write_allowed(24, TLS_DP_RAW)) return 0;  /* belt-and-suspenders */
    /* Stamp the window against the lock's OWN clock (== the 0x24 time we serve). */
    uint32_t now   = core_gmt();
    uint32_t start = now + valid_from;
    uint32_t end   = start + valid_secs;
    uint8_t  val[27];
    uint16_t n = tls_build_temp_pw(val, pw_id, a->txn, start, end, onetime, pw, pwlen);
    if (!n) return 0;                                 /* pwlen out of range */
    a->txn++;                                         /* matches capture 0000->0001 */
    tls_send_dp(&a->tls, 24, TLS_DP_RAW, val, n);
    return 1;
}

int lock_app_is_online(const lock_app_t *a) {
    return a->hal.is_joined ? (a->hal.is_joined(a->hal.user) != 0) : 1;  /* joined = online */
}
