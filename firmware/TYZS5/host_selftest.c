/* host_selftest.c -- offline protocol tests; no EFR32 or Zigbee dependency.
 * Build and run:
 *   cc -std=c99 -Wall -Wextra host_selftest.c nicki_ek_lock_serial.c -o selftest && ./selftest
 */
#include "nicki_ek_lock_serial.h"
#include <stdio.h>
#include <string.h>

static int fails;
#define CHECK(cond, msg) do { \
    if (!(cond)) { printf("FAIL: %s\n", msg); fails++; } \
    else { printf("ok  : %s\n", msg); } \
} while (0)

#define CAP_MAX_WRITES 64
#define CAP_MAX_FRAME  300
static uint8_t g_tx[CAP_MAX_WRITES][CAP_MAX_FRAME];
static size_t g_tx_len[CAP_MAX_WRITES];
static size_t g_tx_count;
static int g_tx_overflow;

static void cap_reset(void)
{
    g_tx_count = 0;
    g_tx_overflow = 0;
}

static void cap_write(const uint8_t *buf, size_t n)
{
    if (g_tx_count >= CAP_MAX_WRITES || n > CAP_MAX_FRAME) {
        g_tx_overflow = 1;
        return;
    }
    memcpy(g_tx[g_tx_count], buf, n);
    g_tx_len[g_tx_count++] = n;
}

static size_t make_frame(uint8_t *out, size_t cap, uint16_t seq, uint8_t cmd,
                         const uint8_t *data, uint16_t len)
{
    size_t total = TLS_FRAME_HEADER_LEN + (size_t)len + 1;
    if (!out || cap < total || len > TLS_MAX_DATA || (len && !data)) return 0;
    out[0] = TLS_HDR0;
    out[1] = TLS_HDR1;
    out[2] = TLS_VERSION;
    out[3] = (uint8_t)(seq >> 8);
    out[4] = (uint8_t)seq;
    out[5] = cmd;
    out[6] = (uint8_t)(len >> 8);
    out[7] = (uint8_t)len;
    if (len) memcpy(out + TLS_FRAME_HEADER_LEN, data, len);
    out[total - 1] = tls_checksum(out, total - 1);
    return total;
}

static bool captured_frame(size_t index, tls_frame_t *out)
{
    return index < g_tx_count && tls_decode_frame(g_tx[index], g_tx_len[index], out);
}

static uint32_t fixed_gmt(void) { return 0x5BF667B1u; }
static int32_t fixed_tz(void) { return 8 * 3600; }

static int g_dp_seen;
static uint8_t g_last_dp_id;
static uint32_t g_last_ts;
static void cap_dp(const tls_dp_t *dp, uint32_t ts)
{
    g_dp_seen++;
    g_last_dp_id = dp->id;
    g_last_ts = ts;
}

static void test_checksums(void)
{
    static const uint8_t product[] =
        {0x55,0xAA,0x03,0x00,0x00,0x01,0x00,0x00};
    static const uint8_t net[] =
        {0x55,0xAA,0x03,0x00,0x00,0x02,0x00,0x00};
    static const uint8_t configure[] =
        {0x55,0xAA,0x03,0x00,0x00,0x03,0x00,0x01,0x01};
    static const uint8_t time[] =
        {0x55,0xAA,0x03,0x00,0x00,0x24,0x00,0x00};
    static const uint8_t record[] = {
        0x55,0xAA,0x03,0x00,0x00,0x23,0x00,0x0D,
        0x01,0x5B,0xF6,0x67,0xB1,0x01,0x02,0x00,0x04,
        0x00,0x00,0x00,0x0B
    };
    static const uint8_t bad_dp49[] = {
        0x55,0xAA,0x03,0x00,0x0B,0x05,0x00,0x07,
        0x31,0x00,0x00,0x02,0x00,0x00,0x01
    };

    CHECK(tls_checksum(product, sizeof(product)) == 0x03, "product-info checksum");
    CHECK(tls_checksum(net, sizeof(net)) == 0x04, "network query checksum");
    CHECK(tls_checksum(configure, sizeof(configure)) == 0x07, "configure checksum");
    CHECK(tls_checksum(time, sizeof(time)) == 0x26, "time-sync request checksum");
    CHECK(tls_checksum(record, sizeof(record)) == 0xAE, "official record checksum");
    CHECK(tls_checksum(bad_dp49, sizeof(bad_dp49)) == 0x4D,
          "uncertain DP49 sample expected checksum is 0x4D");
}

static void test_frame_decoder(void)
{
    uint8_t f[32];
    const uint8_t data[] = {0x08,0x01,0x00,0x01,0x01};
    tls_frame_t decoded;
    size_t n = make_frame(f, sizeof(f), 0x1234, TLS_CMD_REPORT,
                          data, sizeof(data));

    CHECK(n == 14 && tls_decode_frame(f, n, &decoded),
          "decode valid frame with exact length and checksum");
    CHECK(decoded.seq == 0x1234 && decoded.cmd == TLS_CMD_REPORT &&
          decoded.data_len == sizeof(data) && decoded.data[4] == 0x01,
          "decoded frame fields");

    f[n - 1] ^= 0x01;
    CHECK(!tls_decode_frame(f, n, &decoded), "reject corrupt checksum");
    f[n - 1] ^= 0x01;
    f[2] = 0x02;
    CHECK(!tls_decode_frame(f, n, &decoded), "reject unsupported version");
    f[2] = TLS_VERSION;
    CHECK(!tls_decode_frame(f, n - 1, &decoded), "reject truncated frame");
    f[7] = 0x06;
    CHECK(!tls_decode_frame(f, n, &decoded), "reject header length mismatch");
}

static void test_dp_and_raw_parsers(void)
{
    const uint8_t one[] = {0x01,0x04,0x00,0x01,0x01};
    const uint8_t two[] = {
        0x08,0x01,0x00,0x01,0x01,
        0x0A,0x02,0x00,0x04,0x00,0x00,0x00,0x0B
    };
    tls_dp_t dps[4];
    size_t count = 0;
    CHECK(tls_parse_dps(one, sizeof(one), dps, 4) == 1,
          "parse one DP unit");
    CHECK(dps[0].id == 1 && dps[0].type == TLS_DP_ENUM &&
          dps[0].len == 1 && dps[0].value[0] == 1,
          "DP1 enum value");
    CHECK(tls_parse_dps_exact(two, sizeof(two), dps, 4, &count) && count == 2 &&
          dps[1].id == 0x0A && dps[1].value[3] == 0x0B,
          "strict parser accepts two complete DP units");
    CHECK(!tls_parse_dps_exact(two, sizeof(two) - 1, dps, 4, &count),
          "strict parser rejects truncated DP unit");

    const uint8_t temp_create[] = {
        0x12,0x34,0x56,0x78,0x00,0x00,
        0x5B,0xF6,0x67,0xB1,0x5B,0xF6,0x67,0xC0,
        0x01,'1','2','3','4','5','6'
    };
    tls_temp_password_create_t create;
    CHECK(tls_parse_temp_password_create(temp_create, sizeof(temp_create), &create) &&
          create.tuya_seq == 0x1234 && create.server_seq == 0x5678 &&
          create.start_gmt == 0x5BF667B1u && create.one_time == 1 &&
          create.password[5] == '6',
          "DP24 official 21-byte create layout");

    const uint8_t temp_ref[] = {0x12,0x34,0x56,0x78,0x00,0x09};
    tls_temp_password_ref_t ref;
    CHECK(tls_parse_temp_password_ref(25, temp_ref, sizeof(temp_ref), &ref) &&
          ref.manufacturer_id == 9,
          "DP25 six-byte reference layout");

    const uint8_t temp_result[] = {0x12,0x34,0x56,0x78,0x00,0x09,0x02};
    tls_temp_password_result_t result;
    tls_raw_operation_result_t raw_result;
    CHECK(tls_parse_temp_password_result(24, temp_result, sizeof(temp_result), &result) &&
          result.status == 2 &&
          tls_parse_raw_operation_result(24, temp_result, sizeof(temp_result), &raw_result) &&
          raw_result.status == 2,
          "DP24 seven-byte result and SDK RAW wrapper");

    const uint8_t key_set[] = {
        0x01,0x00,0x07,0x5B,0xF6,0x67,0xB1,0x5B,0xF6,0x67,0xC0,
        0x00,0x03,'8','7','6','5','4','3','2','1'
    };
    tls_no_password_key_set_t key;
    CHECK(tls_parse_no_password_key_set(key_set, sizeof(key_set), &key) &&
          key.enabled == 1 && key.key_id == 7 && key.use_count == 3 &&
          key.key[0] == '8',
          "DP48 key-set layout");

    const uint8_t unlock[] = {
        0x01,0x00,0x07,'1','2','3','4','5','6','7','8',
        0x00,0x02
    };
    tls_no_password_unlock_t unlock_req;
    CHECK(tls_parse_no_password_unlock(unlock, sizeof(unlock), &unlock_req) &&
          unlock_req.open == 1 && unlock_req.key_id == 7 &&
          unlock_req.unlock_method == 2 && unlock_req.key[7] == '8',
          "DP49 verified 13-byte key unlock layout");
    CHECK(!tls_parse_no_password_unlock(unlock, sizeof(unlock) - 1, &unlock_req),
          "DP49 rejects incomplete raw value");
    const uint8_t key_result[] = {0x00,0x00,0x07};
    tls_no_password_result_t key_result_decoded;
    CHECK(tls_parse_no_password_result(49, key_result, sizeof(key_result),
                                       &key_result_decoded) &&
          key_result_decoded.status == 0 && key_result_decoded.key_id == 7,
          "DP49 three-byte result layout");

    const uint8_t add_req[] = {0x02,0x00,0x01,0x00,0x7B,0x03,0xE7};
    const uint8_t add_report[] = {0x02,0xFC,0x01,0x00,0x7B,0x03,0xE7,0x02,0x00};
    tls_credential_add_t add;
    CHECK(tls_parse_credential_add(54, add_req, sizeof(add_req), &add) &&
          add.type == 2 && add.member_id == 123 && add.hardware_id == 999,
          "DP54 seven-byte add request");
    CHECK(tls_parse_credential_add(54, add_report, sizeof(add_report), &add) &&
          add.stage == 0xFC && add.enrollment_index == 2 && add.result == 0,
          "DP54 nine-byte add report");

    const uint8_t del_req[] = {0x00,0x00,0x00,0x00,0x7B,0x03,0xE7,0x01};
    const uint8_t del_report[] = {0x00,0x00,0x00,0x00,0x7B,0x03,0xE7,0x01,0xFF};
    tls_credential_delete_t del;
    CHECK(tls_parse_credential_delete(55, del_req, sizeof(del_req), &del) &&
          del.member_id == 123 && del.delete_method == 1,
          "DP55 eight-byte delete request");
    CHECK(tls_parse_credential_delete(55, del_report, sizeof(del_report), &del) &&
          del.result == 0xFF,
          "DP55 nine-byte delete report");

    uint8_t target_temp[27];
    const uint8_t target_pw[] = {'4','7','5','7','6','8'};
    uint16_t target_len = tls_build_temp_pw(target_temp, 0x03E5, 1,
                                            0x6A9FB54Fu, 0x6AA106CFu,
                                            1, target_pw, 6);
    const uint8_t target_expected[] = {
        0x03,0xE5,0x00,0x01,0x00,0x00,
        0x6A,0x9F,0xB5,0x4F,0x6A,0xA1,0x06,0xCF,
        0x00,0x00,0x00,0x00,0x00,0x00,0x01,
        '4','7','5','7','6','8'
    };
    CHECK(target_len == sizeof(target_expected) &&
          memcmp(target_temp, target_expected, sizeof(target_expected)) == 0,
          "TARGET_SRPTWVAK DP24 27-byte builder order");
}

static void test_dynamic_password(void)
{
    const uint8_t request[] = {
        0x5B,0xBC,0x3A,0x41,'3','7','2','2','4','2','0','1',0x02,
        0x06,'0','1','2','3','4','5',0x08,'1','2','3','4','5','6','7','8'
    };
    tls_dynamic_password_t parsed;
    CHECK(tls_parse_dynamic_password(request, sizeof(request), &parsed) &&
          parsed.gmt == 0x5BBC3A41u && parsed.admin_count == 2 &&
          parsed.password[0] == '3' && parsed.admins_len == 16,
          "official dynamic-password request");

    uint8_t malformed[sizeof(request)];
    memcpy(malformed, request, sizeof(malformed));
    malformed[5] = 'X';
    CHECK(!tls_parse_dynamic_password(malformed, sizeof(malformed), &parsed),
          "dynamic-password rejects non-digit password");
    CHECK(!tls_parse_dynamic_password(request, 14, &parsed),
          "dynamic-password rejects short request");
}

static void test_dispatch_and_stream(void)
{
    tls_hal_t hal = {0};
    hal.uart_write = cap_write;
    hal.gmt_now = fixed_gmt;
    hal.tz_offset = fixed_tz;
    hal.on_dp_report = cap_dp;
    tls_ctx_t c;
    tls_init(&c, &hal);

    uint8_t frame[300];
    size_t n = make_frame(frame, sizeof(frame), 0x1234, TLS_CMD_NET_STATUS,
                          NULL, 0);
    cap_reset();
    tls_rx_feed(&c, frame, 3);
    tls_rx_feed(&c, frame + 3, n - 3);
    tls_frame_t reply;
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) &&
          reply.seq == 0x1234 && reply.cmd == TLS_CMD_NET_STATUS &&
          reply.data_len == 1 && reply.data[0] == TLS_NET_GW_AND_SERVER,
          "partial frame -> same-sequence network reply");

    n = make_frame(frame, sizeof(frame), 0x2222, TLS_CMD_TIME_SYNC, NULL, 0);
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) && reply.seq == 0x2222 &&
          reply.cmd == TLS_CMD_TIME_SYNC && reply.data_len == 8 &&
          reply.data[0] == 0x5B && reply.data[1] == 0xF6 &&
          reply.data[2] == 0x67 && reply.data[3] == 0xB1 &&
          reply.data[4] == 0x5B && reply.data[5] == 0xF6 &&
          reply.data[6] == 0xD8 && reply.data[7] == 0x31,
          "time-sync -> standard GMT and local timestamp");

    const uint8_t record_data[] = {
        0x01,0x5B,0xF6,0x67,0xB1,
        0x01,0x02,0x00,0x04,0x00,0x00,0x00,0x0B
    };
    n = make_frame(frame, sizeof(frame), 0x3333, TLS_CMD_RECORD,
                   record_data, sizeof(record_data));
    g_dp_seen = 0;
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_dp_seen == 1 && g_last_dp_id == 1 && g_last_ts == 0x5BF667B1u,
          "0x23 record uses fixed five-byte time prefix");
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) && reply.seq == 0x3333 &&
          reply.cmd == TLS_CMD_RECORD && reply.data[0] == 0x10,
          "valid record gets transfer-success ACK");

    const uint8_t report_data[] = {0x08,0x01,0x00,0x01,0x01};
    n = make_frame(frame, sizeof(frame), 0x4444, TLS_CMD_REPORT,
                   report_data, sizeof(report_data));
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) && reply.seq == 0x4444 &&
          reply.cmd == TLS_CMD_REPORT && reply.data[0] == 0x10,
          "valid DP report gets same-sequence ACK");

    const uint8_t pair_data[] = {0x01};
    n = make_frame(frame, sizeof(frame), 0x5555, TLS_CMD_CONFIGURE,
                   pair_data, sizeof(pair_data));
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_tx_count == 2 && captured_frame(0, &reply) &&
          reply.seq == 0x5555 && reply.cmd == TLS_CMD_CONFIGURE &&
          reply.data[0] == 0x00,
          "configure ACK preserves MCU sequence");
    CHECK(captured_frame(1, &reply) && reply.cmd == TLS_CMD_NET_NOTIFY &&
          reply.data[0] == TLS_NET_GW_AND_SERVER,
          "configure then sends online notification");

    n = make_frame(frame, sizeof(frame), 1, TLS_CMD_NET_NOTIFY,
                   (const uint8_t[]){0x10}, 1);
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_tx_count == 0, "same-sequence 0x06/0x10 ACK is consumed silently");

    const uint8_t offline_ok[] = {
        0x6A,0xA1,0x42,0x85,'1','2','3','4','5','6','7'
    };
    n = make_frame(frame, sizeof(frame), 0x6666, TLS_CMD_OFFLINE_PW,
                   offline_ok, sizeof(offline_ok));
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) &&
          reply.cmd == TLS_CMD_OFFLINE_PW && reply.seq == 0x6666 &&
          reply.data[0] == 0x02,
          "0x08 valid GMT plus seven-digit structure -> no-SecKey");

    n = make_frame(frame, sizeof(frame), 0x6667, TLS_CMD_OFFLINE_PW,
                   offline_ok, sizeof(offline_ok) - 1);
    cap_reset();
    tls_rx_feed(&c, frame, n);
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) && reply.data[0] == 0x03,
          "0x08 short password structure -> length error");
}

static void test_stream_recovery_and_wakeup(void)
{
    tls_hal_t hal = {0};
    hal.uart_write = cap_write;
    tls_ctx_t c;
    tls_init(&c, &hal);

    uint8_t valid[32];
    size_t valid_len = make_frame(valid, sizeof(valid), 0x0102,
                                  TLS_CMD_NET_STATUS, NULL, 0);
    uint8_t bad[32];
    memcpy(bad, valid, valid_len);
    bad[valid_len - 1] ^= 1;
    uint8_t stream[64];
    memcpy(stream, bad, valid_len);
    memcpy(stream + valid_len, valid, valid_len);

    cap_reset();
    const uint8_t noise[] = {0x00,0x11,0x54,0x00,0xAA};
    tls_rx_feed(&c, noise, sizeof(noise));
    tls_rx_feed(&c, stream, sizeof(stream));
    tls_frame_t reply;
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) && reply.seq == 0x0102,
          "bad checksum is dropped and following frame recovers");

    cap_reset();
    tls_rx_feed(&c, valid, 1);
    tls_rx_feed(&c, valid + 1, valid_len - 1);
    CHECK(g_tx_count == 1 && captured_frame(0, &reply),
          "byte-by-byte frame reassembly");

    uint8_t wake[32];
    size_t wake_len = make_frame(wake, sizeof(wake), TLS_WAKE_SEQ_MCU,
                                 TLS_CMD_WAKEUP, NULL, 0);
    uint8_t zeros[TLS_WAKE_PREAMBLE_LEN] = {0};
    cap_reset();
    tls_rx_feed(&c, zeros, sizeof(zeros));
    tls_rx_feed(&c, wake, wake_len);
    CHECK(g_tx_count == 1 && captured_frame(0, &reply) &&
          reply.seq == TLS_WAKE_SEQ_MCU && reply.cmd == TLS_CMD_WAKEUP &&
          reply.data_len == 0,
          "zero wake preamble does not create a phantom frame");

    const uint8_t dp_value[] = {'1','2','3','4','5','6'};
    cap_reset();
    tls_send_dp(&c, 21, TLS_DP_RAW, dp_value, sizeof(dp_value));
    CHECK(g_tx_count == 3 && !g_tx_overflow,
          "outbound DP sends three documented wake attempts");
    for (size_t i = 0; i < g_tx_count; i++) {
        CHECK(g_tx_len[i] == TLS_WAKE_PREAMBLE_LEN + TLS_FRAME_OVERHEAD &&
              memcmp(g_tx[i], zeros, TLS_WAKE_PREAMBLE_LEN) == 0 &&
              tls_decode_frame(g_tx[i] + TLS_WAKE_PREAMBLE_LEN,
                               TLS_FRAME_OVERHEAD, &reply) &&
              reply.seq == TLS_WAKE_SEQ_MODULE && reply.cmd == TLS_CMD_WAKEUP,
              "wake attempt has seven-zero preamble and fixed sequence");
    }

    cap_reset();
    tls_rx_feed(&c, wake, wake_len);
    CHECK(g_tx_count == 2 && captured_frame(0, &reply) &&
          reply.cmd == TLS_CMD_SEND && reply.data_len == 10 &&
          reply.data[0] == 21 && captured_frame(1, &reply) &&
          reply.cmd == TLS_CMD_WAKEUP,
          "MCU wake ACK releases pending 0x04 command");
}

int main(void)
{
    test_checksums();
    test_frame_decoder();
    test_dp_and_raw_parsers();
    test_dynamic_password();
    test_dispatch_and_stream();
    test_stream_recovery_and_wakeup();
    printf("\n%s (%d failure%s)\n", fails ? "FAILURES" : "ALL PASS",
           fails, fails == 1 ? "" : "s");
    return fails ? 1 : 0;
}
