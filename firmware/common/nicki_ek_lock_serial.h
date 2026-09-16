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
#define TLS_FRAME_HEADER_LEN 8        /* hdr(2)+ver(1)+seq(2)+cmd(1)+len(2) */
#define TLS_FRAME_OVERHEAD 9          /* frame header plus the trailing checksum */
#define TLS_WAKE_PREAMBLE_LEN 7       /* zero bytes before every wake frame */
#define TLS_WAKE_SEQ_MODULE 0x55AA    /* module -> MCU wake */
#define TLS_WAKE_SEQ_MCU    0x0000    /* MCU -> module wake */

/* Command bytes (K9bjcnh616mg5) */
typedef enum {
    TLS_CMD_WAKEUP        = 0x00,
    TLS_CMD_PRODUCT_INFO  = 0x01,     /* module->MCU query; MCU replies {"p":..,"v":..} */
    TLS_CMD_NET_STATUS    = 0x02,     /* net-status query/report */
    TLS_CMD_CONFIGURE     = 0x03,     /* reset / pair / factory */
    TLS_CMD_SEND          = 0x04,     /* module->MCU remote control (DP payload) */
    TLS_CMD_REPORT        = 0x05,     /* MCU->module DP status push */
    /* 0x06 is how WE tell the MCU its network status (tls_report_net_status).
     * The generic spec calls 0x06 a proactive DP report in the MCU->module
     * direction, but on this MCU the id is already spoken for outbound, so an
     * INCOMING 0x06 is ambiguous -- plausibly its ack of our notification, in
     * which case answering it would start the same ping-pong the wakeup echo
     * causes. Counted, deliberately not answered, until the tally says which
     * it is. */
    TLS_CMD_NET_NOTIFY    = 0x06,
    TLS_CMD_DYN_PW        = 0x07,     /* dynamic password verify (needs SecKey) */
    TLS_CMD_OFFLINE_PW    = 0x08,     /* offline password verify (needs SecKey) */
    TLS_CMD_QUERY_NET     = 0x20,     /* MCU asks for the network status byte   */
    TLS_CMD_RECORD        = 0x23,     /* DP report w/ timestamp (unlock events) */
    TLS_CMD_GW_STATUS     = 0x25,     /* MCU asks whether the gateway is there   */
    TLS_CMD_NET_CONFIG    = 0x26,     /* MCU pushes network parameters           */
    TLS_CMD_WAKE_WAIT     = 0x2B,     /* MCU sets the wake wait time             */
    TLS_CMD_REPORT_NOLINK = 0x2C,     /* proactive DP report, linkage suppressed */
    /* 0x2C has no outbound use here, so it is unambiguous -- but it is only
     * worth answering once the tally shows the MCU sends it. */
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

typedef struct {
    uint8_t  version;
    uint16_t seq;
    uint8_t  cmd;
    uint16_t data_len;
    const uint8_t *data;              /* points into the supplied frame */
} tls_frame_t;

/* The official 0x07 request contains no secret material in this core. The
 * pointers below refer to the request buffer and are only for validation and
 * inspection by the application or host tests. */
typedef struct {
    uint32_t gmt;
    const uint8_t *password;          /* exactly 8 ASCII digits */
    uint8_t admin_count;
    const uint8_t *admins;            /* length-prefixed ASCII groups */
    uint16_t admins_len;
} tls_dynamic_password_t;

/* Proven SDK wrapper for RAW password-operation reports. The six-byte prefix
 * remains opaque; the final byte is the SDK's operation status byte. */
typedef struct {
    const uint8_t *echo;
    uint16_t echo_len;
    uint8_t status;
} tls_raw_operation_result_t;

/* Official Tuya residential-lock RAW layouts. The pointers refer to the
 * caller's buffer and are valid only while that buffer remains unchanged. */
typedef struct {
    uint16_t tuya_seq;
    uint16_t server_seq;
    uint16_t manufacturer_id;
    uint32_t start_gmt;
    uint32_t end_gmt;
    uint8_t one_time;
    const uint8_t *password;          /* six ASCII digits */
} tls_temp_password_create_t;

typedef struct {
    uint16_t tuya_seq;
    uint16_t server_seq;
    uint16_t manufacturer_id;
} tls_temp_password_ref_t;

typedef struct {
    tls_temp_password_ref_t ref;
    uint8_t status;
} tls_temp_password_result_t;

typedef struct {
    uint8_t enabled;
    uint16_t key_id;
    uint32_t start_gmt;
    uint32_t end_gmt;
    uint16_t use_count;
    const uint8_t *key;
} tls_no_password_key_set_t;

typedef struct {
    uint8_t open;
    uint16_t key_id;
    const uint8_t *key;
    uint16_t unlock_method;
} tls_no_password_unlock_t;

typedef struct {
    uint8_t status;
    uint16_t key_id;
} tls_no_password_result_t;

typedef struct {
    uint8_t type;
    uint8_t stage;
    uint8_t administrator;
    uint16_t member_id;
    uint16_t hardware_id;
    uint8_t enrollment_index;
    uint8_t result;
} tls_credential_add_t;

typedef struct {
    uint8_t type;
    uint8_t stage;
    uint8_t administrator;
    uint16_t member_id;
    uint16_t hardware_id;
    uint8_t delete_method;
    uint8_t result;
} tls_credential_delete_t;

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
    /* A command from the MCU that this layer has no answer for. Optional; the
     * app uses it to surface a count over the air, because the debug ring is
     * SWD-only and an assembled lock has no pads left. */
    void     (*on_unhandled)(uint8_t cmd, void *user);
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
    uint32_t  quirks; /* explicitly selected profile, zero means strict */
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


#define LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9 (1u << 0)
typedef struct {
    uint8_t ref[6];
    uint32_t start_gmt, end_gmt;
    uint8_t schedule_type, weekday_bitmap;
    uint8_t daily_start_hour, daily_start_minute, daily_end_hour, daily_end_minute;
    uint8_t one_time;
    uint8_t password[6];
} tls_temp_password_extended_t;
bool tls_parse_temp_password_extended(const uint8_t *data, uint16_t len,
                                     tls_temp_password_extended_t *out);
uint16_t tls_build_temp_password_extended(uint8_t *out, size_t capacity,
                                          const tls_temp_password_extended_t *value);
bool tls_parse_report_dps(uint8_t cmd, uint32_t quirks, const uint8_t *data,
                         uint16_t len, tls_dp_t *out, size_t max, size_t *count);
/* tls_parse_temp_password_create is the separate 21-byte legacy/public schema.
 * Do not use it for the measured 27-byte extended format. */

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

/* Push a remote-control DP down to the lock (e.g. hub asked to unlock). */
void tls_send_dp(tls_ctx_t *c, uint8_t dp_id, tls_dp_type_t t, const uint8_t *val, uint16_t vlen);

/* TARGET_SRPTWVAK DP24 builder. The generic 21-byte DP24 schema remains a
 * separate evidence profile and is parsed by tls_parse_temp_password_create(). */
#define TLS_TEMP_PW_MAX 16
uint16_t tls_build_temp_pw(uint8_t *out, uint16_t pw_id, uint16_t txn,
                           uint32_t start, uint32_t end, uint8_t onetime,
                           const uint8_t *pw, uint8_t pwlen);

/* Low-level utils (exposed for host tests) */
uint8_t tls_checksum(const uint8_t *frame, size_t len_without_csum);
/* Decode one complete frame, including version, exact length and checksum. */
bool tls_decode_frame(const uint8_t *frame, size_t len, tls_frame_t *out);
/* Parse DP units out of a data payload; returns count, fills up to max. */
size_t tls_parse_dps(const uint8_t *data, uint16_t len, tls_dp_t *out, size_t max);
/* Strict variant: rejects truncated units, trailing bytes, and a too-small out array. */
bool tls_parse_dps_exact(const uint8_t *data, uint16_t len, tls_dp_t *out,
                         size_t max, size_t *count);
/* Validate and expose the official 0x07 dynamic-password request. */
bool tls_parse_dynamic_password(const uint8_t *data, uint16_t len,
                                tls_dynamic_password_t *out);
/* Decode the SDK's 7-byte RAW operation-result wrapper for DP24..33 and DP39. */
bool tls_parse_raw_operation_result(uint8_t dp_id, const uint8_t *data,
                                    uint16_t len, tls_raw_operation_result_t *out);
/* DP24/26 create-or-update request (21 bytes) and DP25/27/28/39 reference
 * request (6 bytes), plus their common seven-byte report layout. */
bool tls_parse_temp_password_create(const uint8_t *data, uint16_t len,
                                    tls_temp_password_create_t *out);
bool tls_parse_temp_password_ref(uint8_t dp_id, const uint8_t *data,
                                 uint16_t len, tls_temp_password_ref_t *out);
bool tls_parse_temp_password_result(uint8_t dp_id, const uint8_t *data,
                                    uint16_t len, tls_temp_password_result_t *out);
/* DP48 and DP49 official key-management layouts. */
bool tls_parse_no_password_key_set(const uint8_t *data, uint16_t len,
                                   tls_no_password_key_set_t *out);
bool tls_parse_no_password_unlock(const uint8_t *data, uint16_t len,
                                  tls_no_password_unlock_t *out);
bool tls_parse_no_password_result(uint8_t dp_id, const uint8_t *data,
                                  uint16_t len, tls_no_password_result_t *out);
/* DP54/55 add/delete request and MCU report layouts. */
bool tls_parse_credential_add(uint8_t dp_id, const uint8_t *data,
                              uint16_t len, tls_credential_add_t *out);
bool tls_parse_credential_delete(uint8_t dp_id, const uint8_t *data,
                                 uint16_t len, tls_credential_delete_t *out);

#endif /* NICKI_EK_LOCK_SERIAL_H */
