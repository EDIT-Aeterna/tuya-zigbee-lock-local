/* lock_app.h -- portable TYZS3 firmware application (toolchain-independent).
 *
 * Wraps the proven serial core:
 *   nicki_ek_lock_serial  (MCU<->module UART, the Nicki_EK protocol)
 *
 * The EFR32 layer (efr32_*.c) supplies the HAL: USART bytes in/out, a Zigbee
 * EF00 transport and time. This file has NO hardware or SDK dependency, so the
 * whole control path is host-testable (lock_app_selftest).
 *
 * Data path: lock MCU --UART--> nicki_ek core --DP--> EF00 --> hub, and hub --EF00-->
 * DP write --> 0x04 --> MCU for remote control (unlock, temp passwords).
 *
 * The anti-clone claim/auth machinery (kagel_hub_auth + ed25519 + sha256/512, the
 * relay-signed claim blob, mutual challenge and the inert gate) was REMOVED
 * 2026-07-17 -- Nicki's call (2026-07-15): "we will load the firmware ourself", so
 * there is no claim to gate on. "Online" reported to the MCU is simply JOINED to a
 * coordinator (is_joined). History is in git; the design notes live in memory.
 */
#ifndef LOCK_APP_H
#define LOCK_APP_H
#include "nicki_ek_lock_serial.h"
#include "lock_profile.h"
#include <stdint.h>
#include <stddef.h>

/* Hub-lock control messages carried over the Zigbee FC00 vendor channel.
 * Values 1..6 were the claim/auth handshake and are RETIRED -- kept as a gap so
 * an old hub build can never have a stale message land on a new meaning. NOTE the
 * shipping control path does NOT use these: remote unlock and temp passwords both
 * ride EF00 DP writes (z2m's datapoint converters -> lock_app_ef00_rx), which is what
 * is proven on hardware. These stay as the documented vendor channel. */
typedef enum {
    LOCK_MSG_REMOTE_DP    = 7,  /* hub->mod: dp_id(1)+type(1)+len(2)+val, remote ctl */
    LOCK_MSG_CREATE_TEMP_PW=8,  /* hub->mod: pw_id(2 BE)+valid_from(4 BE)+valid_secs(4 BE)
                                 * +onetime(1)+pwlen(1)+pw(ASCII). Module stamps the
                                 * validity window from ITS OWN clock and emits DP24. */
} lock_msg_t;

typedef struct {
    /* Zigbee EF00: report a lock DP up to the hub (z2m lock converter). */
    void (*zb_ef00_report)(uint8_t dp_id, uint8_t type, const uint8_t *val,
                           uint16_t len, uint32_t ts, void *user);
    /* UART to the lock MCU. */
    void (*uart_write)(const uint8_t *buf, size_t n, void *user);
    /* Time (unix GMT secs) from the coordinator; answers the MCU's 0x24 and stamps
     * temp-password validity windows. */
    uint32_t (*gmt_now)(void *user);
    /* Debug (optional): every serial frame the MCU sends, before dispatch. */
    void (*on_frame)(uint8_t cmd, const uint8_t *data, uint16_t dlen, void *user);
    void (*on_unhandled)(uint8_t cmd, void *user);
    /* MCU requested (re)pairing/factory-reset (0x03). Integrator leaves the Zigbee
     * network and re-steers so the module rejoins an open permit window. */
    void (*on_config)(uint8_t sub, void *user);
    /* Returns nonzero when the module is JOINED to a Zigbee coordinator. Drives
     * "online" reported to the lock MCU. NULL -> always-online (host tests). */
    int  (*is_joined)(void *user);
    void *user;
} lock_app_hal_t;

typedef struct {
    lock_app_hal_t hal;
    tls_ctx_t      tls;
    const lock_profile_t *profile;
    char observed_pid[17];
    char mcu_version[17];
    bool observed_ota;
    bool pid_mismatch; /* sticky until reinitialization */
    bool pid_verified;
    bool product_query_started;
    bool mcu_seen;
    bool product_info_seen;
    bool product_info_retry_sent;
    uint16_t       txn;     /* DP24 temp-pw transaction counter (per the capture) */
} lock_app_t;

/* Bring up the app: wires the serial core to the HAL. Call once at boot. */
void lock_app_init(lock_app_t *a, const lock_app_hal_t *hal);

/* Kick the MCU dialogue at boot (product-info query). Does NOT announce online:
 * that waits until we are actually joined to a coordinator. */
void lock_app_start(lock_app_t *a);

/* Feed raw UART bytes from the lock MCU. */
void lock_app_uart_rx(lock_app_t *a, const uint8_t *bytes, size_t n);

/* Proactively push net-status "online" (GW+server) to the lock MCU so it starts
 * streaming DP reports. A real Nicki_EK module announces the connection unprompted;
 * without it the MCU sits provisioned-but-offline and never reports unlock events.
 * No-op unless online (= joined to a coordinator), so an unjoined module never
 * tells the MCU it is provisioned -- that false "pairing successful" was a real bug.
 * Safe to call repeatedly — the EFR32 tick re-asserts it as the MCU keep-alive. */
void lock_app_announce_online(lock_app_t *a);

/* Force the lock MCU to re-request the time (Nicki_EK 0x24) by bouncing net-status
 * offline->online. Call right after the module's clock is (re)set so the MCU
 * picks up the real time immediately instead of on its slow periodic poll.
 * No-op while offline. */
void lock_app_resync_time(lock_app_t *a);

/* Dispatch an inbound hub-lock control message (from the Zigbee FC00 channel). */
void lock_app_zb_rx(lock_app_t *a, lock_msg_t type, const uint8_t *buf, size_t len);

/* Dispatch an inbound Zigbee EF00 dataRequest(0x00)/sendData(0x04) from the hub
 * (z2m's datapoint converters): parses [seq(2) | dp,type,len(2 BE),value ...] and
 * forwards each DP to the lock MCU (remote control: unlock, remote_unlock_switch,
 * ring tone...). Gated: only forwards when online (joined),
 * so a rogue coordinator can't drive the lock. */
void lock_app_ef00_rx(lock_app_t *a, uint8_t cmd, const uint8_t *buf, size_t len);

/* Create a temporary keypad password on the lock (DP24 password_creat). The
 * module builds the validity window from its OWN 0x24 clock — start = now +
 * valid_from, end = start + valid_secs — so the timestamps always agree with
 * what the lock verifies against (the failure mode of every earlier attempt).
 * pw_id is the hub-assigned 16-bit slot used to later delete/disable the code.
 * onetime: 0 = reusable within the window. Gated on the anti-clone gate (no-op
 * unless a claimed+authed hub). Returns 1 if the DP24 frame was emitted, else 0
 * (gate closed or pwlen outside 1..TLS_TEMP_PW_MAX). */
int  lock_app_create_temp_pw(lock_app_t *a, uint16_t pw_id, uint32_t valid_from,
                             uint32_t valid_secs, uint8_t onetime,
                             const uint8_t *pw, uint8_t pwlen);

/* Status accessors. */
int  lock_app_is_online(const lock_app_t *a);   /* bound AND authed this session */

#endif
