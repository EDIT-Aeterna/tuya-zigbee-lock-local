/* nicki_ek_lock_serial.h -- portable Nicki_EK MCU<->module serial core for a Zigbee
 * residential lock. We implement the MODULE side: talk Nicki_EK MCU serial to the
 * lock's MCU over UART, and hand DP events to a radio/app layer (our hub).
 *
 * Toolchain-independent (C99, no libc beyond string/stdint). Bring your own
 * UART + time + zigbee via the HAL hooks below. Spec sources:
 *   - Nicki_EK "Zigbee Door Lock Universal Docking Agreement" (K9bjcnh616mg5, v1.0.26)
 *   - Nicki_EK "Residential Lock DP Reference" (v20240613)
 * PHY: 115200 8N1 3.3V. Frame: 55 AA | ver | seq(2 BE) | cmd | len(2 BE) | data | csum
 * csum = sum of all preceding bytes mod 256 (verified against doc examples).
 */
#ifndef NICKI_EK_LOCK_SERIAL_H
#define NICKI_EK_LOCK_SERIAL_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define TLS_HDR0 0x55
#define TLS_HDR1 0xAA
#define TLS_VERSION 0x03
#define TLS_MAX_DATA 256              /* residential lock caps DP report well under this */
#define TLS_FRAME_OVERHEAD 8          /* hdr(2)+ver(1)+seq(2)+cmd(1)+len(2) ... +csum(1)=8 total non-data */

/* Command bytes (K9bjcnh616mg5) */
typedef enum {
    TLS_CMD_WAKEUP        = 0x00,
    TLS_CMD_PRODUCT_INFO  = 0x01,     /* module->MCU query; MCU replies {"p":..,"v":..} */
    TLS_CMD_NET_STATUS    = 0x02,     /* net-status query/report */
    TLS_CMD_CONFIGURE     = 0x03,     /* reset / pair / factory */
    TLS_CMD_SEND          = 0x04,     /* module->MCU remote control (DP payload) */
    TLS_CMD_REPORT        = 0x05,     /* MCU->module DP status push */
    TLS_CMD_NET_NOTIFY    = 0x06,     /* async net-status broadcast */
    TLS_CMD_DYN_PW        = 0x07,     /* dynamic password verify (needs SecKey) */
    TLS_CMD_OFFLINE_PW    = 0x08,     /* offline password verify (needs SecKey) */
    TLS_CMD_RECORD        = 0x23,     /* DP report w/ timestamp (unlock events) */
    TLS_CMD_TIME_SYNC     = 0x24,     /* MCU->module time request */
} tls_cmd_t;

/* Network status byte (0x02 / 0x06). We report GW_AND_SERVER so the MCU
 * believes it is online and begins streaming unlock DPs. */
typedef enum {
    TLS_NET_NO_GW         = 0x00,
    TLS_NET_GW            = 0x01,
    TLS_NET_SERVER        = 0x02,
    TLS_NET_GW_AND_SERVER = 0x03,     /* <-- the "fake online" value we serve */
    TLS_NET_NO_SERVER     = 0x04,
    TLS_NET_GW_NO_SERVER  = 0x05,
} tls_net_status_t;

/* DP value types (residential lock DP reference) */
typedef enum {
    TLS_DP_RAW    = 0x00,
    TLS_DP_BOOL   = 0x01,
    TLS_DP_INT    = 0x02,             /* 4-byte signed, big-endian */
    TLS_DP_STRING = 0x03,
    TLS_DP_ENUM   = 0x04,
    TLS_DP_BITMAP = 0x05,
} tls_dp_type_t;

typedef struct {
    uint8_t  id;
    uint8_t  type;
    uint16_t len;
    const uint8_t *value;            /* points into the parsed frame buffer */
} tls_dp_t;

/* ---- HAL hooks the integrator supplies (EFR32 / Telink / host-test) ---- */
typedef struct {
    void     (*uart_write)(const uint8_t *buf, size_t n);
    uint32_t (*gmt_now)(void);        /* unix seconds, GMT */
    int32_t  (*tz_offset)(void);      /* local-GMT offset in seconds */
    /* Called for every DP the MCU reports (via 0x05 or 0x23). ts==0 if none. */
    void     (*on_dp_report)(const tls_dp_t *dp, uint32_t ts);
    /* Called once the MCU has announced its product info. */
    void     (*on_product_info)(const char *json, size_t n, bool ota);
    /* Hub-lock gate (optional). When set, the core answers the MCU's online
     * queries with GW_AND_SERVER only if this returns true, else NO_GW -- i.e.
     * the lock stays inert until the bound Kagel hub has authenticated. NULL
     * preserves the always-online behaviour (kept for the core's own tests). */
    bool     (*is_online)(void *user);
    /* Debug/inspection (optional): called for EVERY complete frame the MCU
     * sends, before dispatch. Lets the integrator capture exactly which serial
     * commands the lock MCU issues (e.g. 0x07 dyn-pw / 0x08 offline-pw verify)
     * during a password attempt -- ground truth instead of inference. */
    void     (*on_frame)(uint8_t cmd, const uint8_t *data, uint16_t dlen, void *user);
    /* MCU requested (re)pairing / factory-reset via 0x03 configure (user put the
     * lock in pairing). sub = the config data byte (0xFF if none). The integrator
     * should LEAVE the Zigbee network and re-steer so the module rejoins the open
     * permit window -- without this a module holding stale creds never re-joins and
     * the app's add-device times out. NULL = ignore (core still ACKs the MCU). */
    void     (*on_config)(uint8_t sub, void *user);
    void      *user;                  /* opaque, passed to is_online */
} tls_hal_t;

typedef struct {
    tls_hal_t hal;
    uint16_t  tx_seq;
    /* RX reassembly */
    uint8_t   rx[TLS_FRAME_OVERHEAD + TLS_MAX_DATA];
    size_t    rx_len;
    size_t    rx_need;                /* full frame length once header parsed, else 0 */
    /* Wakeup-verified command send (0x04): buffered until the sleepy MCU proves awake. */
    uint8_t   pend_buf[4 + TLS_MAX_DATA];
    uint16_t  pend_len;
    uint8_t   pend_active;
    uint8_t   pend_ticks;
    uint8_t   pend_wakes;
} tls_ctx_t;

void tls_pending_tick(tls_ctx_t *c);

/* Lifecycle */
void tls_init(tls_ctx_t *c, const tls_hal_t *hal);
/* Feed raw UART bytes as they arrive; dispatches complete frames. */
void tls_rx_feed(tls_ctx_t *c, const uint8_t *bytes, size_t n);

/* Outbound helpers (module -> MCU) */
void tls_send_frame(tls_ctx_t *c, tls_cmd_t cmd, const uint8_t *data, uint16_t len);
void tls_report_net_status(tls_ctx_t *c, tls_net_status_t s);   /* answer/announce online */
void tls_announce_online(tls_ctx_t *c);                         /* push "paired+online" to the MCU */
void tls_request_product_info(tls_ctx_t *c);                    /* module->MCU 0x01 query (boot) */
void tls_boot(tls_ctx_t *c);                                    /* mirror the stock module's opening moves */

/* module->MCU: local = GMT + this. As of 2026-07-22 (Nicki) the lock runs on
 * TRUE UTC: z2m syncs correct UTC (genTime.time) and the hub stamps temp-code
 * windows in UTC, so the served "local" clock must equal UTC too. Keep this 0 --
 * a non-zero offset here re-introduces the old "lock is N hours ahead" skew and
 * forces a compensating fudge on the hub side. Timezone is a display concern the
 * app/hub own, not the lock. */
#define TLS_DEFAULT_TZ_OFFSET 0
/* Push a remote-control DP down to the lock (e.g. hub asked to unlock). */
void tls_send_dp(tls_ctx_t *c, uint8_t dp_id, tls_dp_type_t t, const uint8_t *val, uint16_t vlen);

/* Build a DP24 password_creat RAW value (GROUND-TRUTH capture 2026-07-15, on the
 * genuine module->MCU line — supersedes the earlier DP54 theory). Layout:
 *   pw_id(2 BE) | 00 01 | txn(2 BE) | start(4 BE) | end(4 BE) | onetime(1) |
 *   reserved 00 x6 | pw(ASCII, pwlen)
 * start/end are GMT unix seconds and MUST be measured against the lock's OWN
 * 0x24 clock (mismatch there is why temp codes silently failed before). Writes
 * 21+pwlen bytes to out and returns that length; 0 if out==NULL or pwlen is
 * outside 1..TLS_TEMP_PW_MAX. Send the result via tls_send_dp(c,24,TLS_DP_RAW,..). */
#define TLS_TEMP_PW_MAX 16
uint16_t tls_build_temp_pw(uint8_t *out, uint16_t pw_id, uint16_t txn,
                           uint32_t start, uint32_t end, uint8_t onetime,
                           const uint8_t *pw, uint8_t pwlen);

/* Low-level utils (exposed for host tests) */
uint8_t tls_checksum(const uint8_t *frame, size_t len_without_csum);
/* Parse DP units out of a data payload; returns count, fills up to max. */
size_t tls_parse_dps(const uint8_t *data, uint16_t len, tls_dp_t *out, size_t max);

#endif /* NICKI_EK_LOCK_SERIAL_H */
