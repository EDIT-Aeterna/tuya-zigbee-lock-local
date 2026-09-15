/*
 * Stage 2E-A reviewer-supplied EF00 integration test.
 * Do not modify this file to obtain PASS.
 *
 * Valid controls:
 *   DP21: existing 6-digit password remote unlock
 *   DP48: target remote-key provisioning, narrow profile
 *
 * DP49 and every other control DP remain blocked.
 *
 * Build from repo root:
 *   gcc -std=c99 -Wall -Wextra -Werror \
 *       stage2ea_ef00_integration_test.c \
 *       firmware/lock_app.c firmware/nicki_ek_lock_serial.c \
 *       firmware/kagel_control_gate.c \
 *       -I firmware -o /tmp/stage2ea_ef00_test
 *   /tmp/stage2ea_ef00_test
 */
#include "lock_app.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint8_t txbuf[4096];
static size_t txlen;

static void uart_write(const uint8_t *p, size_t n, void *user)
{
    (void)user;
    if (txlen + n <= sizeof txbuf) {
        memcpy(txbuf + txlen, p, n);
        txlen += n;
    }
}

static uint32_t gmt_now(void *user)
{
    (void)user;
    return 0x6AA14285u;
}

static int is_joined(void *user)
{
    (void)user;
    return 1;
}

static void init_app(lock_app_t *a)
{
    lock_app_hal_t h;
    memset(&h, 0, sizeof h);
    h.uart_write = uart_write;
    h.gmt_now = gmt_now;
    h.is_joined = is_joined;
    txlen = 0;
    memset(txbuf, 0, sizeof txbuf);
    lock_app_init(a, &h);
}

static int fail(const char *name, const char *why)
{
    fprintf(stderr, "FAIL %-36s %s\n", name, why);
    return 1;
}

static int expect_no_uart(const char *name, const uint8_t *payload, size_t len)
{
    lock_app_t a;
    init_app(&a);
    lock_app_ef00_rx(&a, 0x00, payload, len);
    if (txlen != 0) {
        char msg[96];
        snprintf(msg, sizeof msg, "unexpected UART side effect: %zu byte(s)", txlen);
        return fail(name, msg);
    }
    printf("PASS %-36s no UART side effect\n", name);
    return 0;
}

static int send_and_check_single(const char *name,
                                 const uint8_t *payload, size_t len,
                                 uint8_t expected_dp,
                                 const uint8_t *expected_value, size_t expected_len)
{
    lock_app_t a;
    init_app(&a);

    lock_app_ef00_rx(&a, 0x00, payload, len);

    /* Stage-1.1 path: 3 x 16-byte wake attempts first. */
    if (txlen != 48)
        return fail(name, "expected exactly three wake writes before wake ACK");

    const uint8_t wake_ack[] = {
        0x55,0xAA,0x03,0x55,0xAA,0x00,0x00,0x00,0x01
    };
    lock_app_uart_rx(&a, wake_ack, sizeof wake_ack);

    const size_t frame_len = 9 + 4 + expected_len;
    if (txlen != 48 + frame_len)
        return fail(name, "expected exactly one application UART frame");

    const uint8_t *f = txbuf + 48;
    if (f[0] != 0x55 || f[1] != 0xAA || f[2] != 0x03 || f[5] != 0x04)
        return fail(name, "bad UART frame header/cmd");

    if (f[6] != (uint8_t)((4 + expected_len) >> 8) ||
        f[7] != (uint8_t)(4 + expected_len))
        return fail(name, "bad outer data length");

    if (f[8] != expected_dp || f[9] != 0x00 ||
        f[10] != (uint8_t)(expected_len >> 8) ||
        f[11] != (uint8_t)expected_len)
        return fail(name, "bad DP header");

    if (memcmp(f + 12, expected_value, expected_len) != 0)
        return fail(name, "DP value differs");

    uint8_t sum = 0;
    for (size_t i = 0; i < frame_len - 1; ++i)
        sum = (uint8_t)(sum + f[i]);
    if (sum != f[frame_len - 1])
        return fail(name, "bad UART checksum");

    printf("PASS %-36s exactly one DP%u application command\n",
           name, (unsigned)expected_dp);
    return 0;
}

int main(void)
{
    int failures = 0;

    const uint8_t dp21_value[] = {'5','7','5','7','5','7'};
    const uint8_t dp21[] = {
        0x00,0x01,
        0x15,0x00,0x00,0x06,
        '5','7','5','7','5','7'
    };
    failures += send_and_check_single("valid DP21 regression",
                                      dp21, sizeof dp21,
                                      21, dp21_value, sizeof dp21_value);

    const uint8_t dp48_value[] = {
        0x01,0x00,0x01,
        0x6A,0xA1,0x7C,0x6E,
        0x72,0xBC,0x9B,0x7F,
        0xFF,0xFF,
        '4','1','0','0','1','5','4','3'
    };
    const uint8_t dp48[] = {
        0x00,0x02,
        0x30,0x00,0x00,0x15,
        0x01,0x00,0x01,
        0x6A,0xA1,0x7C,0x6E,
        0x72,0xBC,0x9B,0x7F,
        0xFF,0xFF,
        '4','1','0','0','1','5','4','3'
    };
    failures += send_and_check_single("valid target DP48 provisioning",
                                      dp48, sizeof dp48,
                                      48, dp48_value, sizeof dp48_value);

    const uint8_t dp49_forbidden[] = {
        0x00,0x03,
        0x31,0x00,0x00,0x0D,
        0x01,0x00,0x01,
        '3','3','0','8','7','8','8','2',
        0x00,0x01
    };
    failures += expect_no_uart("DP49 remains forbidden",
                               dp49_forbidden, sizeof dp49_forbidden);

    uint8_t bad48[sizeof dp48];

    memcpy(bad48, dp48, sizeof dp48);
    bad48[6] = 0x00;  /* enable = 0 */
    failures += expect_no_uart("DP48 disable rejected",
                               bad48, sizeof bad48);

    memcpy(bad48, dp48, sizeof dp48);
    bad48[8] = 0x02;  /* key_id = 2 */
    failures += expect_no_uart("DP48 key_id != 1 rejected",
                               bad48, sizeof bad48);

    memcpy(bad48, dp48, sizeof dp48);
    bad48[17] = 0x00; bad48[18] = 0x01; /* use_count != FFFF */
    failures += expect_no_uart("DP48 finite use_count rejected",
                               bad48, sizeof bad48);

    memcpy(bad48, dp48, sizeof dp48);
    bad48[19] = 'A';
    failures += expect_no_uart("DP48 non-digit key rejected",
                               bad48, sizeof bad48);

    const uint8_t wrong_type[] = {
        0x00,0x02,
        0x30,0x01,0x00,0x15,
        0x01,0x00,0x01,
        0x6A,0xA1,0x7C,0x6E,
        0x72,0xBC,0x9B,0x7F,
        0xFF,0xFF,
        '4','1','0','0','1','5','4','3'
    };
    failures += expect_no_uart("DP48 wrong datatype rejected",
                               wrong_type, sizeof wrong_type);

    const uint8_t truncated[] = {
        0x00,0x02,
        0x30,0x00,0x00,0x15,
        0x01,0x00,0x01,0x6A
    };
    failures += expect_no_uart("truncated DP48 rejected",
                               truncated, sizeof truncated);

    /* A valid DP48 plus trailing malformed data must be atomic-rejected. */
    uint8_t compound[sizeof dp48 + 3];
    memcpy(compound, dp48, sizeof dp48);
    compound[sizeof dp48 + 0] = 0x18;
    compound[sizeof dp48 + 1] = 0x00;
    compound[sizeof dp48 + 2] = 0x00;
    failures += expect_no_uart("valid DP48 + malformed tail",
                               compound, sizeof compound);

    printf("\n%s (%d failure%s)\n",
           failures ? "FAILURES" : "ALL PASS",
           failures, failures == 1 ? "" : "s");
    return failures ? 1 : 0;
}
