/* nicki_ek_lock_serial.c -- see header. Module-side Nicki_EK MCU serial core. */
#include "nicki_ek_lock_serial.h"
#include <string.h>

uint8_t tls_checksum(const uint8_t *frame, size_t len_without_csum)
{
    unsigned sum = 0;
    for (size_t i = 0; i < len_without_csum; i++) sum += frame[i];
    return (uint8_t)(sum & 0xFF);
}

static void wr16(uint8_t *p, uint16_t v) { p[0] = (uint8_t)(v >> 8); p[1] = (uint8_t)v; }
static uint16_t rd16(const uint8_t *p) { return (uint16_t)((p[0] << 8) | p[1]); }

static uint32_t rd32(const uint8_t *p)
{
    return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8) | (uint32_t)p[3];
}

bool tls_decode_frame(const uint8_t *frame, size_t len, tls_frame_t *out)
{
    if (!frame || !out || len < TLS_FRAME_HEADER_LEN + 1) return false;
    if (frame[0] != TLS_HDR0 || frame[1] != TLS_HDR1 ||
        frame[2] != TLS_VERSION) return false;

    uint16_t dlen = rd16(&frame[6]);
    if (dlen > TLS_MAX_DATA ||
        len != (size_t)TLS_FRAME_HEADER_LEN + dlen + 1)
        return false;
    if (tls_checksum(frame, len - 1) != frame[len - 1]) return false;

    out->version = frame[2];
    out->seq = rd16(&frame[3]);
    out->cmd = frame[5];
    out->data_len = dlen;
    out->data = &frame[TLS_FRAME_HEADER_LEN];
    return true;
}

static void tls_send_frame_seq(tls_ctx_t *c, uint16_t seq, tls_cmd_t cmd,
                                const uint8_t *data, uint16_t len)
{
    uint8_t f[TLS_FRAME_OVERHEAD + TLS_MAX_DATA];
    if (!c || len > TLS_MAX_DATA || (len && !data)) return;
    f[0] = TLS_HDR0; f[1] = TLS_HDR1; f[2] = TLS_VERSION;
    wr16(&f[3], seq);
    f[5] = (uint8_t)cmd;
    wr16(&f[6], len);
    if (len) memcpy(&f[TLS_FRAME_HEADER_LEN], data, len);
    size_t body = TLS_FRAME_HEADER_LEN + len; /* everything except trailing csum */
    f[body] = tls_checksum(f, body);
    if (c->hal.uart_write) c->hal.uart_write(f, body + 1);
}

void tls_send_frame(tls_ctx_t *c, tls_cmd_t cmd, const uint8_t *data, uint16_t len)
{
    if (!c || len > TLS_MAX_DATA || (len && !data)) return;
    tls_send_frame_seq(c, c->tx_seq++, cmd, data, len);
}

/* --- Wakeup-VERIFIED command send: the lock MCU is sleepy and drops a 0x04 command sent
 * while idle. We buffer the command, wake the MCU, and transmit only once it proves it's
 * awake (any frame it sends -> tls_flush_pending in handle_frame). tls_pending_tick retries
 * the wakeup if the MCU stays silent. --- */
static void tls_send_wakeup(tls_ctx_t *c) {
    /* The official wake frame is preceded by seven zero bytes. Keep the
     * retransmission count here; timing remains an application concern. */
    uint8_t w[TLS_WAKE_PREAMBLE_LEN + TLS_FRAME_OVERHEAD] = {0};
    uint8_t *f = &w[TLS_WAKE_PREAMBLE_LEN];
    f[0] = TLS_HDR0; f[1] = TLS_HDR1; f[2] = TLS_VERSION;
    wr16(&f[3], TLS_WAKE_SEQ_MODULE);
    f[5] = (uint8_t)TLS_CMD_WAKEUP; f[6] = 0; f[7] = 0;
    f[8] = tls_checksum(f, TLS_FRAME_HEADER_LEN);
    if (c && c->hal.uart_write) {
        c->hal.uart_write(w, sizeof w);
        c->hal.uart_write(w, sizeof w);
        c->hal.uart_write(w, sizeof w);
    }
}

static void tls_flush_pending(tls_ctx_t *c) {
    if (!c->pend_active) return;
    c->pend_active = 0;
    tls_send_frame(c, TLS_CMD_SEND, c->pend_buf, c->pend_len);
}

void tls_pending_tick(tls_ctx_t *c) {
    if (!c->pend_active) return;
    if (++c->pend_ticks < 4) return;      /* ~0.7s at the ~6/s app tick */
    c->pend_ticks = 0;
    if (c->pend_wakes < 8) { c->pend_wakes++; tls_send_wakeup(c); }
    else tls_flush_pending(c);            /* many chances given -> send anyway */
}

void tls_report_net_status(tls_ctx_t *c, tls_net_status_t s)
{
    uint8_t b = (uint8_t)s;
    tls_send_frame(c, TLS_CMD_NET_NOTIFY, &b, 1);
}

void tls_announce_online(tls_ctx_t *c)
{
    /* Call once our EFR32 has joined the hub (or unconditionally on boot to
     * unblock the MCU immediately). The MCU trusts this -- it has no radio to
     * check against. This is what makes the lock "understand it is paired." */
    tls_report_net_status(c, TLS_NET_GW_AND_SERVER);
}

void tls_request_product_info(tls_ctx_t *c)
{
    /* Stock module's first real move at boot: 0x01 with empty payload. The MCU
     * replies 0x01 + {"p":PID,"v":ver}+OTA (handled in dispatch). */
    tls_send_frame(c, TLS_CMD_PRODUCT_INFO, NULL, 0);
}

void tls_boot(tls_ctx_t *c)
{
    /* Reproduce the opening the real module performs (capture #2):
     * query product-info, then step the MCU to gateway -> gateway+server. */
    tls_request_product_info(c);
    tls_report_net_status(c, TLS_NET_GW);
    tls_report_net_status(c, TLS_NET_GW_AND_SERVER);
}

void tls_send_dp(tls_ctx_t *c, uint8_t dp_id, tls_dp_type_t t,
                 const uint8_t *val, uint16_t vlen)
{
    if (!c || vlen > TLS_MAX_DATA - 4 || (vlen && !val)) return;
    /* Buffer + wake + verify (see tls_flush_pending). Only 0x04 commands go through here;
     * net-status/announce/acks are sent immediately elsewhere. */
    c->pend_buf[0] = dp_id; c->pend_buf[1] = (uint8_t)t; wr16(&c->pend_buf[2], vlen);
    if (vlen && val) memcpy(&c->pend_buf[4], val, vlen);
    c->pend_len = (uint16_t)(4 + vlen);
    c->pend_active = 1; c->pend_ticks = 0; c->pend_wakes = 0;
    tls_send_wakeup(c);
}

static void wr32(uint8_t *p, uint32_t v) {
    p[0]=(uint8_t)(v>>24); p[1]=(uint8_t)(v>>16); p[2]=(uint8_t)(v>>8); p[3]=(uint8_t)v;
}

uint16_t tls_build_temp_pw(uint8_t *out, uint16_t pw_id, uint16_t txn,
                           uint32_t start, uint32_t end, uint8_t onetime,
                           const uint8_t *pw, uint8_t pwlen)
{
    /* TARGET_SRPTWVAK profile: prefix(6), start(4), end(4),
     * unknown/reserved(6), one-time(1), password(6). */
    if (!out || !pw || pwlen != 6) return 0;
    uint16_t i = 0;
    wr16(&out[i], pw_id); i += 2;
    wr16(&out[i], txn); i += 2;
    out[i++] = 0x00; out[i++] = 0x00; /* target manufacturer ID */
    wr32(&out[i], start); i += 4;
    wr32(&out[i], end); i += 4;
    for (int z = 0; z < 6; z++) out[i++] = 0x00;
    out[i++] = onetime;
    memcpy(&out[i], pw, 6); i += 6;
    return i; /* 27 bytes */
}

size_t tls_parse_dps(const uint8_t *data, uint16_t len, tls_dp_t *out, size_t max)
{
    size_t n = 0, i = 0;
    if ((!data && len) || (!out && max)) return 0;
    while (i + 4 <= len && n < max) {
        tls_dp_t dp;
        dp.id = data[i]; dp.type = data[i + 1];
        dp.len = rd16(&data[i + 2]);
        if (i + 4 + dp.len > len) break;      /* truncated -- stop */
        dp.value = &data[i + 4];
        out[n++] = dp;
        i += 4 + dp.len;
    }
    return n;
}

bool tls_parse_dps_exact(const uint8_t *data, uint16_t len, tls_dp_t *out,
                         size_t max, size_t *count)
{
    size_t n = 0, i = 0;
    if (count) *count = 0;
    if ((!data && len) || (!out && len)) return false;

    while (i < len) {
        if (i + 4 > len || n >= max) return false;
        tls_dp_t dp;
        dp.id = data[i];
        dp.type = data[i + 1];
        dp.len = rd16(&data[i + 2]);
        if (i + 4 + dp.len > len) return false;
        dp.value = &data[i + 4];
        out[n++] = dp;
        i += 4 + dp.len;
    }
    if (count) *count = n;
    return true;
}

static bool ascii_digits(const uint8_t *data, size_t len)
{
    if (!data && len) return false;
    for (size_t i = 0; i < len; i++)
        if (data[i] < (uint8_t)'0' || data[i] > (uint8_t)'9') return false;
    return true;
}

bool tls_parse_dynamic_password(const uint8_t *data, uint16_t len,
                                tls_dynamic_password_t *out)
{
    /* The generic protocol says the request is at least 15 bytes. */
    if (!data || !out || len < 15) return false;
    if (!ascii_digits(data + 4, 8)) return false;

    uint8_t admin_count = data[12];
    if (admin_count > 10) return false;
    size_t i = 13;
    for (uint8_t group = 0; group < admin_count; group++) {
        if (i >= len) return false;
        uint8_t group_len = data[i++];
        if (group_len == 0 || group_len > 8 || i + group_len > len)
            return false;
        if (!ascii_digits(data + i, group_len)) return false;
        i += group_len;
    }
    if (i != len) return false;

    out->gmt = rd32(data);
    out->password = data + 4;
    out->admin_count = admin_count;
    out->admins = data + 13;
    out->admins_len = (uint16_t)(len - 13);
    return true;
}

bool tls_parse_raw_operation_result(uint8_t dp_id, const uint8_t *data,
                                    uint16_t len, tls_raw_operation_result_t *out)
{
    bool sdk_wrapped_id = (dp_id >= 0x18 && dp_id <= 0x21) || dp_id == 0x27;
    if (!sdk_wrapped_id || !data || !out || len != 7) return false;
    out->echo = data;
    out->echo_len = 6;
    out->status = data[6];
    return true;
}

static bool is_temp_password_create_dp(uint8_t dp_id)
{
    return dp_id == 0x18 || dp_id == 0x1A; /* DP24 create, DP26 modify */
}

static bool is_temp_password_ref_dp(uint8_t dp_id)
{
    return dp_id == 0x19 || dp_id == 0x1B || dp_id == 0x1C || dp_id == 0x27;
    /* DP25 delete, DP27 freeze, DP28 unfreeze, DP39 clear */
}

static bool is_temp_password_dp(uint8_t dp_id)
{
    return is_temp_password_create_dp(dp_id) || is_temp_password_ref_dp(dp_id);
}

bool tls_parse_temp_password_create(const uint8_t *data, uint16_t len,
                                    tls_temp_password_create_t *out)
{
    if (!data || !out || len != 21) return false;
    if (data[14] > 1 || !ascii_digits(data + 15, 6)) return false;

    out->tuya_seq = rd16(data);
    out->server_seq = rd16(data + 2);
    out->manufacturer_id = rd16(data + 4);
    out->start_gmt = rd32(data + 6);
    out->end_gmt = rd32(data + 10);
    out->one_time = data[14];
    out->password = data + 15;
    return true;
}

bool tls_parse_temp_password_ref(uint8_t dp_id, const uint8_t *data,
                                 uint16_t len, tls_temp_password_ref_t *out)
{
    if (!is_temp_password_ref_dp(dp_id) || !data || !out || len != 6)
        return false;
    out->tuya_seq = rd16(data);
    out->server_seq = rd16(data + 2);
    out->manufacturer_id = rd16(data + 4);
    return true;
}

bool tls_parse_temp_password_result(uint8_t dp_id, const uint8_t *data,
                                    uint16_t len, tls_temp_password_result_t *out)
{
    if (!is_temp_password_dp(dp_id) || !data || !out || len != 7)
        return false;
    out->ref.tuya_seq = rd16(data);
    out->ref.server_seq = rd16(data + 2);
    out->ref.manufacturer_id = rd16(data + 4);
    out->status = data[6];
    return true;
}

bool tls_parse_no_password_key_set(const uint8_t *data, uint16_t len,
                                   tls_no_password_key_set_t *out)
{
    if (!data || !out || len != 21 || data[0] > 1) return false;
    out->enabled = data[0];
    out->key_id = rd16(data + 1);
    out->start_gmt = rd32(data + 3);
    out->end_gmt = rd32(data + 7);
    out->use_count = rd16(data + 11);
    out->key = data + 13;
    return true;
}

bool tls_parse_no_password_unlock(const uint8_t *data, uint16_t len,
                                  tls_no_password_unlock_t *out)
{
    if (!data || !out || len != 15 || data[0] > 1) return false;
    uint32_t method = ((uint32_t)data[11] << 24) |
                      ((uint32_t)data[12] << 16) |
                      ((uint32_t)data[13] << 8) | data[14];
    if (method > 3) return false;
    out->open = data[0];
    out->key_id = rd16(data + 1);
    out->key = data + 3;
    out->unlock_method = method;
    return true;
}

bool tls_parse_no_password_result(uint8_t dp_id, const uint8_t *data,
                                  uint16_t len, tls_no_password_result_t *out)
{
    if ((dp_id != 48 && dp_id != 49) || !data || !out || len != 3)
        return false;
    if ((dp_id == 48 && data[0] > 1) || (dp_id == 49 && data[0] > 5))
        return false;
    out->status = data[0];
    out->key_id = rd16(data + 1);
    return true;
}

bool tls_parse_credential_add(uint8_t dp_id, const uint8_t *data,
                              uint16_t len, tls_credential_add_t *out)
{
    if (dp_id != 54 || !data || !out || (len != 7 && len != 9)) return false;
    out->type = data[0];
    out->stage = data[1];
    out->administrator = data[2];
    out->member_id = rd16(data + 3);
    out->hardware_id = rd16(data + 5);
    out->enrollment_index = (len == 9) ? data[7] : 0;
    out->result = (len == 9) ? data[8] : 0;
    return true;
}

bool tls_parse_credential_delete(uint8_t dp_id, const uint8_t *data,
                                 uint16_t len, tls_credential_delete_t *out)
{
    if (dp_id != 55 || !data || !out || (len != 8 && len != 9)) return false;
    out->type = data[0];
    out->stage = data[1];
    out->administrator = data[2];
    out->member_id = rd16(data + 3);
    out->hardware_id = rd16(data + 5);
    out->delete_method = data[7];
    out->result = (len == 9) ? data[8] : 0;
    return true;
}

/* ---- inbound dispatch ---------------------------------------------------- */

/* Gated net status: online only when the hub-lock gate says so (or always, if
 * no gate hook is installed -- preserves the core's standalone behaviour). */
static tls_net_status_t tls_gate(tls_ctx_t *c)
{
    if (c->hal.is_online)
        return c->hal.is_online(c->hal.user) ? TLS_NET_GW_AND_SERVER : TLS_NET_NO_GW;
    return TLS_NET_GW_AND_SERVER;
}

static bool valid_offline_password(const uint8_t *data, uint16_t len)
{
    return data && len >= 11 && len <= 14 && ascii_digits(data + 4, len - 4);
}

static void handle_frame(tls_ctx_t *c, const uint8_t *f, size_t flen)
{
    uint8_t  cmd = f[5];
    uint16_t seq = rd16(&f[3]);
    uint16_t dlen = rd16(&f[6]);
    const uint8_t *data = &f[TLS_FRAME_HEADER_LEN];
    (void)flen;

    if (c->hal.on_frame) c->hal.on_frame(cmd, data, dlen, c->hal.user);

    /* Any frame from the MCU proves it's awake -> release a wakeup-verified command. */
    tls_flush_pending(c);

    switch (cmd) {
    case TLS_CMD_WAKEUP:
        /* A zero-sequence wake is initiated by the MCU and must be echoed with
         * the same fixed sequence. A 0x55AA frame is the MCU's response to our
         * wake and must not be echoed back. */
        if (seq == TLS_WAKE_SEQ_MCU)
            tls_send_frame_seq(c, TLS_WAKE_SEQ_MCU, TLS_CMD_WAKEUP, NULL, 0);
        break;

    case TLS_CMD_PRODUCT_INFO:
        /* MCU's reply carries JSON {"p":PID,"v":ver} then a trailing OTA flag. */
        if (c->hal.on_product_info && dlen >= 1) {
            bool ota = (data[dlen - 1] == 0x01);
            c->hal.on_product_info((const char *)data, dlen - 1, ota);
        }
        break;

    case TLS_CMD_NET_NOTIFY:
        /* Target cold boot ACK: same sequence, command 0x06, status 0x10.
         * Consume it silently; do not ACK an ACK or report it as unhandled. */
        if (dlen == 1 && data[0] == 0x10)
            break;
        if (c->hal.on_unhandled) c->hal.on_unhandled(cmd, c->hal.user);
        break;

    case TLS_CMD_NET_STATUS:
        /* The query response is command 0x02 with the request's sequence.
         * Command 0x06 is the separate asynchronous module notification. */
        { uint8_t b = (uint8_t)tls_gate(c);
          tls_send_frame_seq(c, seq, TLS_CMD_NET_STATUS, &b, 1); }
        break;

    case TLS_CMD_CONFIGURE: {
        /* MCU's "add device" ceremony: cmd 0x01 = start pairing. Ack success,
         * then assert online so the MCU marks itself provisioned. Command 0x00
         * (factory reset) / 0x02 (reset notify) we also just ack OK. */
        uint8_t ok = 0x00;
        tls_send_frame_seq(c, seq, TLS_CMD_CONFIGURE, &ok, 1);
        /* User pressed pair / factory-reset -> tell the integrator FIRST (it sets a
         * "pairing" flag that forces is_online false + triggers a network leave),
         * THEN report net-status. On a pair the report is now OFFLINE, so the MCU
         * cannot mark "pairing successful" off a stale online (the instant-success
         * bug). Order matters: reporting before on_config sent the stale online. */
        if (c->hal.on_config) c->hal.on_config(dlen ? data[0] : 0xFF, c->hal.user);
        tls_report_net_status(c, tls_gate(c));
        break;
    }

    case TLS_CMD_TIME_SYNC: {
        /* Official format: standard GMT followed by local GMT, both BE. */
        uint8_t t[8]; uint32_t g = c->hal.gmt_now ? c->hal.gmt_now() : 0;
        int32_t off = c->hal.tz_offset ? c->hal.tz_offset() : 0;
        uint32_t std = g;
        uint32_t l = (uint32_t)((int64_t)g + (int64_t)off);
        t[0]=(uint8_t)(std>>24); t[1]=(uint8_t)(std>>16); t[2]=(uint8_t)(std>>8); t[3]=(uint8_t)std;
        t[4]=(uint8_t)(l>>24); t[5]=(uint8_t)(l>>16); t[6]=(uint8_t)(l>>8); t[7]=(uint8_t)l;
        tls_send_frame_seq(c, seq, TLS_CMD_TIME_SYNC, t, 8);
        break;
    }

    case TLS_CMD_REPORT: {
        /* DP status push (no timestamp). Forward each DP to the app/radio. */
        tls_dp_t dps[16];
        size_t k = 0;
        bool valid = dlen != 0 && tls_parse_dps_exact(data, dlen, dps, 16, &k);
        if (valid) {
            for (size_t i = 0; i < k; i++)
                if (c->hal.on_dp_report) c->hal.on_dp_report(&dps[i], 0);
        }
        /* ACK the DP report with TRANSFER-OK (0x10), NOT the net-status byte.
         * The MCU treats a non-0x10 ack as "not delivered" and RETRIES the report
         * forever -> the post-add/delete sync-bitmap flood. Online-ness is asserted
         * by the periodic net-status announce, so this ack is purely delivery. */
        uint8_t b = valid ? 0x10 : 0x20;   /* xfer ok / fail */
        tls_send_frame_seq(c, seq, TLS_CMD_REPORT, &b, 1);
        break;
    }

    case TLS_CMD_RECORD: {
        /* DP report with timestamp: timeflag(1) + ts(4) + DP units. */
        if (dlen < 5) {
            uint8_t b = 0x20;
            tls_send_frame_seq(c, seq, TLS_CMD_RECORD, &b, 1);
            break;
        }
        uint8_t flag = data[0];
        uint32_t ts = rd32(&data[1]);
        tls_dp_t dps[16];
        size_t k = 0;
        bool valid = (flag == 0x00 || flag == 0x01) && dlen > 5 &&
                     tls_parse_dps_exact(data + 5, (uint16_t)(dlen - 5), dps, 16, &k);
        if (valid) {
            for (size_t i = 0; i < k; i++)
                if (c->hal.on_dp_report) c->hal.on_dp_report(&dps[i], ts);
        }
        uint8_t b = valid ? 0x10 : 0x20;
        tls_send_frame_seq(c, seq, TLS_CMD_RECORD, &b, 1);
        break;
    }

    case TLS_CMD_QUERY_NET:
        /* "What is the network status?" -- one byte, same table as 0x02. */
        tls_report_net_status(c, tls_gate(c));
        break;

    case TLS_CMD_GW_STATUS: {
        /* "Is the gateway there?" 0x00 offline / 0x01 online / 0x02 timeout.
         * The MCU is built to be TOLD the gateway is unreachable; silence is
         * not one of the answers it knows how to handle. */
        uint8_t b = (tls_gate(c) == TLS_NET_GW_AND_SERVER) ? 0x01 : 0x00;
        tls_send_frame_seq(c, seq, TLS_CMD_GW_STATUS, &b, 1);
        break;
    }

    case TLS_CMD_NET_CONFIG:
    case TLS_CMD_WAKE_WAIT: {
        /* We keep our own radio parameters, but the MCU expects a result byte
         * and will sit waiting for one. Answer "ok" rather than nothing. */
        uint8_t b = 0x01;
        tls_send_frame_seq(c, seq, (tls_cmd_t)cmd, &b, 1);
        break;
    }

    case TLS_CMD_DYN_PW:
        /* No SecKey algorithm is implemented here. Still distinguish a
         * structurally valid request from the official length-error result. */
        { tls_dynamic_password_t req;
          uint8_t b = tls_parse_dynamic_password(data, dlen, &req) ? 0x02 : 0x03;
          tls_send_frame_seq(c, seq, TLS_CMD_DYN_PW, &b, 1); }
        break;

    case TLS_CMD_OFFLINE_PW:
        /* The official format is GMT(4) plus 7..10 ASCII password bytes. */
        { uint8_t b = valid_offline_password(data, dlen) ? 0x02 : 0x03;
          tls_send_frame_seq(c, seq, TLS_CMD_OFFLINE_PW, &b, 1); }
        break;

    default:
        /* Still unhandled (OTA 0x0A-0x0D, 0x09 test). Counted and reported by
         * the app so the next gap is MEASURED instead of inferred -- the ring
         * and counters were SWD-only, and these locks are assembled shut. */
        if (c->hal.on_unhandled) c->hal.on_unhandled(cmd, c->hal.user);
        break;
    }
}

/* ---- byte-stream reassembly --------------------------------------------- */

void tls_init(tls_ctx_t *c, const tls_hal_t *hal)
{
    if (!c || !hal) return;
    memset(c, 0, sizeof(*c));
    c->hal = *hal;
}

static void rx_reset(tls_ctx_t *c) { c->rx_len = 0; c->rx_need = 0; }

void tls_rx_feed(tls_ctx_t *c, const uint8_t *bytes, size_t n)
{
    if (!c || (!bytes && n)) return;
    for (size_t i = 0; i < n; i++) {
        uint8_t b = bytes[i];

        /* Resync on header. */
        if (c->rx_len == 0) { if (b == TLS_HDR0) c->rx[c->rx_len++] = b; continue; }
        if (c->rx_len == 1) {
            if (b == TLS_HDR1) c->rx[c->rx_len++] = b;
            else { rx_reset(c); if (b == TLS_HDR0) c->rx[c->rx_len++] = b; }
            continue;
        }

        if (c->rx_len < sizeof(c->rx)) c->rx[c->rx_len++] = b;
        else { rx_reset(c); continue; }       /* overflow -> drop */

        /* Once we have through the length field, compute the full frame size. */
        if (c->rx_len == TLS_FRAME_HEADER_LEN) {
            uint16_t dlen = rd16(&c->rx[6]);
            if (dlen > TLS_MAX_DATA) { rx_reset(c); continue; }
            c->rx_need = TLS_FRAME_HEADER_LEN + dlen + 1; /* + checksum */
        }

        if (c->rx_need && c->rx_len == c->rx_need) {
            tls_frame_t decoded;
            if (tls_decode_frame(c->rx, c->rx_need, &decoded)
                && decoded.data_len <= TLS_MAX_DATA)
                handle_frame(c, c->rx, c->rx_need);
            rx_reset(c);
        }
    }
}
