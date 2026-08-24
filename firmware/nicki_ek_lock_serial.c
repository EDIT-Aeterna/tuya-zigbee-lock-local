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

void tls_send_frame(tls_ctx_t *c, tls_cmd_t cmd, const uint8_t *data, uint16_t len)
{
    uint8_t f[TLS_FRAME_OVERHEAD + TLS_MAX_DATA];
    if (len > TLS_MAX_DATA) return;
    f[0] = TLS_HDR0; f[1] = TLS_HDR1; f[2] = TLS_VERSION;
    wr16(&f[3], c->tx_seq++);
    f[5] = (uint8_t)cmd;
    wr16(&f[6], len);
    if (len && data) memcpy(&f[8], data, len);
    size_t body = 8 + len;                    /* everything except the trailing csum */
    f[body] = tls_checksum(f, body);
    if (c->hal.uart_write) c->hal.uart_write(f, body + 1);
}

/* --- Wakeup-VERIFIED command send: the lock MCU is sleepy and drops a 0x04 command sent
 * while idle. We buffer the command, wake the MCU, and transmit only once it proves it's
 * awake (any frame it sends -> tls_flush_pending in handle_frame). tls_pending_tick retries
 * the wakeup if the MCU stays silent. --- */
static void tls_send_wakeup(tls_ctx_t *c) {
    /* Wake the SLEEPY lock MCU with the SENTINEL-seq (0x55AA) wakeup preamble it responds to
     * (captured off stock 2026-07-20: `55 AA 03 55 AA 00 00 00 01`) -- NOT a normal incrementing
     * seq, which the MCU ignores while idle. Sent a few times, like the real gateway does. */
    uint8_t w[9];
    w[0] = TLS_HDR0; w[1] = TLS_HDR1; w[2] = TLS_VERSION;
    w[3] = 0x55; w[4] = 0xAA;                       /* seq = 0x55AA sentinel */
    w[5] = (uint8_t)TLS_CMD_WAKEUP; w[6] = 0; w[7] = 0;
    w[8] = tls_checksum(w, 8);
    if (c->hal.uart_write) { c->hal.uart_write(w, 9); c->hal.uart_write(w, 9); c->hal.uart_write(w, 9); }
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
    if (vlen > TLS_MAX_DATA) return;
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
    if (!out || pwlen < 1 || pwlen > TLS_TEMP_PW_MAX) return 0;
    uint16_t i = 0;
    wr16(&out[i], pw_id);  i += 2;
    out[i++] = 0x00; out[i++] = 0x01;      /* srvSer: constant 0x0001 in capture   */
    wr16(&out[i], txn);    i += 2;         /* txn counter: 0x0000->0x0001 observed  */
    wr32(&out[i], start);  i += 4;         /* valid-from, GMT unix (lock's 0x24 clk)*/
    wr32(&out[i], end);    i += 4;         /* valid-to,   GMT unix                  */
    out[i++] = onetime;                    /* 0x00 = multi-use within window        */
    for (int z = 0; z < 6; z++) out[i++] = 0x00;   /* reserved (schedule/weekday)   */
    if (pw) memcpy(&out[i], pw, pwlen);
    i += pwlen;
    return i;                              /* 21 + pwlen (27 for a 6-digit code)    */
}

size_t tls_parse_dps(const uint8_t *data, uint16_t len, tls_dp_t *out, size_t max)
{
    size_t n = 0, i = 0;
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

/* ---- inbound dispatch ---------------------------------------------------- */

/* Gated net status: online only when the hub-lock gate says so (or always, if
 * no gate hook is installed -- preserves the core's standalone behaviour). */
static tls_net_status_t tls_gate(tls_ctx_t *c)
{
    if (c->hal.is_online)
        return c->hal.is_online(c->hal.user) ? TLS_NET_GW_AND_SERVER : TLS_NET_NO_GW;
    return TLS_NET_GW_AND_SERVER;
}

static void handle_frame(tls_ctx_t *c, const uint8_t *f, size_t flen)
{
    uint8_t  cmd = f[5];
    uint16_t dlen = rd16(&f[6]);
    const uint8_t *data = &f[8];
    (void)flen;

    if (c->hal.on_frame) c->hal.on_frame(cmd, data, dlen, c->hal.user);

    /* Any frame from the MCU proves it's awake -> release a wakeup-verified command. */
    tls_flush_pending(c);

    switch (cmd) {
    case TLS_CMD_WAKEUP:
        /* A wakeup is a ONE-WAY "I'm about to send" preamble -- just wake and wait
         * for the real frame. Do NOT echo it: the MCU mirrors our echo back and it
         * becomes an infinite wakeup ping-pong storm. Our own sends don't prefix a
         * wakeup, so dropping the echo costs nothing. */
        break;

    case TLS_CMD_PRODUCT_INFO:
        /* MCU's reply carries JSON {"p":PID,"v":ver} then a trailing OTA flag. */
        if (c->hal.on_product_info && dlen >= 1) {
            bool ota = (data[dlen - 1] == 0x01);
            c->hal.on_product_info((const char *)data, dlen - 1, ota);
        }
        break;

    case TLS_CMD_NET_STATUS:
        /* MCU is asking whether we're online -- answer via the hub-lock gate. */
        tls_report_net_status(c, tls_gate(c));
        break;

    case TLS_CMD_CONFIGURE: {
        /* MCU's "add device" ceremony: cmd 0x01 = start pairing. Ack success,
         * then assert online so the MCU marks itself provisioned. Command 0x00
         * (factory reset) / 0x02 (reset notify) we also just ack OK. */
        uint8_t ok = 0x00;
        tls_send_frame(c, TLS_CMD_CONFIGURE, &ok, 1);
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
        /* MCU wants time. Answer 4B std GMT + 4B local GMT (big-endian).
         *
         * The MCU does NOT simply stamp Local. It stamps by a fixed relation to BOTH
         * fields, anchored on its factory China (+8h) default. Measured 2026-07-23
         * (offsets from UTC, hours):
         *   (Local +4, Std 0) -> +4    (Local 0, Std 0) -> +8 (China, Local==Std)
         *   (Local  0, Std -1) -> +6   (Local 0, Std -4) -> 0 (UTC)  <= what we ship
         * which fit  stamp = 8 - Local + 2*Standard. To land the stamp on true UTC we
         * keep Local = UTC and back-shift STANDARD by tz_offset (= 14400 = 4h):
         *   8 - 0 + 2*(-4h) = 0.  Global, date-correct, no per-region firmware.
         * (tz_offset is calibrated to cancel China, NOT just a threshold nudge; a 1s
         * gap is separately rounded to zero and also falls back to China.) */
        uint8_t t[8]; uint32_t g = c->hal.gmt_now ? c->hal.gmt_now() : 0;
        uint32_t off = (c->hal.tz_offset ? (uint32_t)c->hal.tz_offset() : 0);
        uint32_t std = g - off;   /* Standard = UTC - N  (defeats the equality check) */
        uint32_t l   = g;         /* Local    = UTC      (what the MCU stamps == GMT) */
        t[0]=(uint8_t)(std>>24); t[1]=(uint8_t)(std>>16); t[2]=(uint8_t)(std>>8); t[3]=(uint8_t)std;
        t[4]=(uint8_t)(l>>24); t[5]=(uint8_t)(l>>16); t[6]=(uint8_t)(l>>8); t[7]=(uint8_t)l;
        tls_send_frame(c, TLS_CMD_TIME_SYNC, t, 8);
        break;
    }

    case TLS_CMD_REPORT: {
        /* DP status push (no timestamp). Forward each DP to the app/radio. */
        tls_dp_t dps[16];
        size_t k = tls_parse_dps(data, dlen, dps, 16);
        for (size_t i = 0; i < k; i++)
            if (c->hal.on_dp_report) c->hal.on_dp_report(&dps[i], 0);
        /* ACK the DP report with TRANSFER-OK (0x10), NOT the net-status byte.
         * The MCU treats a non-0x10 ack as "not delivered" and RETRIES the report
         * forever -> the post-add/delete sync-bitmap flood. Online-ness is asserted
         * by the periodic net-status announce, so this ack is purely delivery. */
        uint8_t b = 0x10;   /* TLS xfer status: 0x10 ok / 0x20 fail */
        tls_send_frame(c, TLS_CMD_REPORT, &b, 1);
        break;
    }

    case TLS_CMD_RECORD: {
        /* DP report with timestamp: timeflag(1) + ts(4, if flag=1) + DP units. */
        if (dlen < 1) break;
        uint8_t flag = data[0];
        uint32_t ts = 0; size_t off = 1;
        if (flag == 0x01 && dlen >= 5) { ts = ((uint32_t)data[1]<<24)|((uint32_t)data[2]<<16)|((uint32_t)data[3]<<8)|data[4]; off = 5; }
        tls_dp_t dps[16];
        size_t k = tls_parse_dps(data + off, (uint16_t)(dlen - off), dps, 16);
        for (size_t i = 0; i < k; i++)
            if (c->hal.on_dp_report) c->hal.on_dp_report(&dps[i], ts);
        uint8_t b = 0x10;   /* xfer-ok (was net-status 0x03 -> MCU retried -> flood) */
        tls_send_frame(c, TLS_CMD_RECORD, &b, 1);
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
        tls_send_frame(c, TLS_CMD_GW_STATUS, &b, 1);
        break;
    }

    case TLS_CMD_NET_CONFIG:
    case TLS_CMD_WAKE_WAIT: {
        /* We keep our own radio parameters, but the MCU expects a result byte
         * and will sit waiting for one. Answer "ok" rather than nothing. */
        uint8_t b = 0x01;
        tls_send_frame(c, (tls_cmd_t)cmd, &b, 1);
        break;
    }

    case TLS_CMD_DYN_PW:
    case TLS_CMD_OFFLINE_PW:
        /* v1: SecKey crypto not implemented -> report "no SecKey" (0x02). */
        { uint8_t b = 0x02; tls_send_frame(c, (tls_cmd_t)cmd, &b, 1); }
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
    memset(c, 0, sizeof(*c));
    c->hal = *hal;
}

static void rx_reset(tls_ctx_t *c) { c->rx_len = 0; c->rx_need = 0; }

void tls_rx_feed(tls_ctx_t *c, const uint8_t *bytes, size_t n)
{
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
        if (c->rx_len == 8) {
            uint16_t dlen = rd16(&c->rx[6]);
            if (dlen > TLS_MAX_DATA) { rx_reset(c); continue; }
            c->rx_need = 8 + dlen + 1;         /* + trailing checksum */
        }

        if (c->rx_need && c->rx_len == c->rx_need) {
            uint8_t want = tls_checksum(c->rx, c->rx_need - 1);
            if (want == c->rx[c->rx_need - 1]) handle_frame(c, c->rx, c->rx_need);
            rx_reset(c);
        }
    }
}
