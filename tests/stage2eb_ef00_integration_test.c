/*
 * Stage 2E-B reviewer-supplied EF00 integration test.
 * Do not modify this file to obtain PASS.
 *
 * Allowed controls:
 *   DP21 - existing password remote unlock
 *   DP48 - existing remote-key provisioning
 *   DP49 - target password-free remote unlock
 *
 * Every other control DP remains blocked.
 *
 * Build:
 *   gcc -std=c99 -Wall -Wextra -Werror \
 *       stage2eb_ef00_integration_test.c \
 *       firmware/lock_app.c firmware/nicki_ek_lock_serial.c \
 *       firmware/kagel_control_gate.c \
 *       -I firmware -o /tmp/stage2eb_ef00_test
 *   /tmp/stage2eb_ef00_test
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
    fprintf(stderr, "FAIL %-38s %s\n", name, why);
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
    printf("PASS %-38s no UART side effect\n", name);
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

    printf("PASS %-38s exactly one DP%u application command\n",
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
    failures += send_and_check_single("DP21 regression",
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
    failures += send_and_check_single("DP48 regression",
                                      dp48, sizeof dp48,
                                      48, dp48_value, sizeof dp48_value);

    const uint8_t dp49_value[] = {
        0x01,0x00,0x01,
        '7','8','7','8','7','8','7','8',
        0x00,0x01
    };
    const uint8_t dp49[] = {
        0x00,0x03,
        0x31,0x00,0x00,0x0D,
        0x01,0x00,0x01,
        '7','8','7','8','7','8','7','8',
        0x00,0x01
    };
    failures += send_and_check_single("valid target DP49",
                                      dp49, sizeof dp49,
                                      49, dp49_value, sizeof dp49_value);

    uint8_t bad49[sizeof dp49];

    memcpy(bad49, dp49, sizeof dp49);
    bad49[6] = 0x00; /* state */
    failures += expect_no_uart("DP49 state != 1 rejected", bad49, sizeof bad49);

    memcpy(bad49, dp49, sizeof dp49);
    bad49[8] = 0x02; /* key id */
    failures += expect_no_uart("DP49 key_id != 1 rejected", bad49, sizeof bad49);

    memcpy(bad49, dp49, sizeof dp49);
    bad49[9] = 'A';
    failures += expect_no_uart("DP49 non-digit key rejected", bad49, sizeof bad49);

    memcpy(bad49, dp49, sizeof dp49);
    bad49[19] = 0x00; bad49[20] = 0x02; /* method */
    failures += expect_no_uart("DP49 method != 1 rejected", bad49, sizeof bad49);

    const uint8_t wrong_type[] = {
        0x00,0x03,
        0x31,0x01,0x00,0x0D,
        0x01,0x00,0x01,
        '7','8','7','8','7','8','7','8',
        0x00,0x01
    };
    failures += expect_no_uart("DP49 wrong datatype rejected",
                               wrong_type, sizeof wrong_type);

    const uint8_t truncated[] = {
        0x00,0x03,
        0x31,0x00,0x00,0x0D,
        0x01,0x00,0x01,'7','8'
    };
    failures += expect_no_uart("truncated DP49 rejected",
                               truncated, sizeof truncated);

    const uint8_t forbidden_dp24[] = {
        0x00,0x04,
        0x18,0x00,0x00,0x01,0x00
    };
    failures += expect_no_uart("DP24 remains forbidden",
                               forbidden_dp24, sizeof forbidden_dp24);

    /* Atomicity: valid DP49 plus malformed tail must have zero side effect. */
    uint8_t compound[sizeof dp49 + 3];
    memcpy(compound, dp49, sizeof dp49);
    compound[sizeof dp49 + 0] = 0x18;
    compound[sizeof dp49 + 1] = 0x00;
    compound[sizeof dp49 + 2] = 0x00;
    failures += expect_no_uart("valid DP49 + malformed tail",
                               compound, sizeof compound);

    printf("\n%s (%d failure%s)\n",
           failures ? "FAILURES" : "ALL PASS",
           failures, failures == 1 ? "" : "s");
    return failures ? 1 : 0;
}
