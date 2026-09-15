/*
 * Stage 2D-R reviewer-supplied EF00 -> UART integration test.
 * Do not modify this file to obtain PASS.
 *
 * It verifies the first enabled control path is:
 *   exactly one valid DP21 RAW unit -> one pending UART application command.
 *
 * An invalid/malformed/compound EF00 payload must have NO UART side effect.
 *
 * Build from repo root:
 *   gcc -std=c99 -Wall -Wextra -Werror \
 *       stage2dr_ef00_integration_test.c \
 *       firmware/lock_app.c firmware/nicki_ek_lock_serial.c \
 *       firmware/kagel_control_gate.c \
 *       -I firmware -o /tmp/stage2dr_ef00_test
 *   /tmp/stage2dr_ef00_test
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
    fprintf(stderr, "FAIL %-34s %s\n", name, why);
    return 1;
}

static int expect_no_uart(const char *name, uint8_t cmd,
                          const uint8_t *payload, size_t len)
{
    lock_app_t a;
    init_app(&a);
    lock_app_ef00_rx(&a, cmd, payload, len);
    if (txlen != 0) {
        char msg[96];
        snprintf(msg, sizeof msg, "unexpected UART side effect: %zu byte(s)", txlen);
        return fail(name, msg);
    }
    printf("PASS %-34s no UART side effect\n", name);
    return 0;
}

int main(void)
{
    int failures = 0;

    /* seq(2) + DP21 RAW len=6 + ASCII "575757" */
    const uint8_t valid[] = {
        0x00,0x01,
        0x15,0x00,0x00,0x06,
        '5','7','5','7','5','7'
    };

    {
        lock_app_t a;
        init_app(&a);
        lock_app_ef00_rx(&a, 0x00, valid, sizeof valid);

        /* Stage-1.1 tls_send_dp() emits three 16-byte wake writes first. */
        if (txlen != 48) {
            failures += fail("single valid DP21",
                             "expected exactly three wake writes before MCU wake ACK");
        } else {
            /* MCU response to module-originated fixed 0x55AA wake. */
            const uint8_t wake_ack[] = {
                0x55,0xAA,0x03,0x55,0xAA,0x00,0x00,0x00,0x01
            };
            lock_app_uart_rx(&a, wake_ack, sizeof wake_ack);

            if (txlen != 67) {
                failures += fail("single valid DP21",
                                 "expected exactly one 19-byte DP21 application frame");
            } else {
                const uint8_t *f = txbuf + 48;
                if (f[0] != 0x55 || f[1] != 0xAA ||
                    f[5] != 0x04 || f[6] != 0x00 || f[7] != 0x0A ||
                    f[8] != 0x15 || f[9] != 0x00 ||
                    f[10] != 0x00 || f[11] != 0x06 ||
                    memcmp(f + 12, "575757", 6) != 0) {
                    failures += fail("single valid DP21",
                                     "wrong UART command/payload");
                } else {
                    uint8_t sum = 0;
                    for (size_t i = 0; i < 18; ++i) sum = (uint8_t)(sum + f[i]);
                    if (sum != f[18])
                        failures += fail("single valid DP21", "bad UART checksum");
                    else
                        puts("PASS single valid DP21                 exactly one application command");
                }
            }
        }
    }

    const uint8_t wrong_type[] = {
        0x00,0x01, 0x15,0x01,0x00,0x06, '5','7','5','7','5','7'
    };
    failures += expect_no_uart("DP21 wrong datatype", 0x00,
                               wrong_type, sizeof wrong_type);

    const uint8_t short_pw[] = {
        0x00,0x01, 0x15,0x00,0x00,0x05, '5','7','5','7','5'
    };
    failures += expect_no_uart("DP21 five digits", 0x00,
                               short_pw, sizeof short_pw);

    const uint8_t nondigit[] = {
        0x00,0x01, 0x15,0x00,0x00,0x06, '5','7','A','7','5','7'
    };
    failures += expect_no_uart("DP21 non-digit", 0x00,
                               nondigit, sizeof nondigit);

    const uint8_t forbidden_dp24[] = {
        0x00,0x01, 0x18,0x00,0x00,0x01, 0x00
    };
    failures += expect_no_uart("forbidden DP24", 0x00,
                               forbidden_dp24, sizeof forbidden_dp24);

    const uint8_t truncated_single[] = {
        0x00,0x01, 0x15,0x00,0x00,0x06, '5','7','5'
    };
    failures += expect_no_uart("truncated DP21", 0x00,
                               truncated_single, sizeof truncated_single);

    /*
     * Critical atomicity case:
     * a valid DP21 comes first, but a second DP unit is truncated.
     * The WHOLE EF00 command is malformed and must have zero UART side effects.
     */
    const uint8_t valid_then_truncated[] = {
        0x00,0x01,
        0x15,0x00,0x00,0x06, '5','7','5','7','5','7',
        0x18,0x00,0x00,0x05, 0x01,0x02
    };
    failures += expect_no_uart("valid DP21 + truncated tail", 0x00,
                               valid_then_truncated, sizeof valid_then_truncated);

    /*
     * Stage 2D-R intentionally accepts one control DP per EF00 request.
     * Two valid DP21 units are ambiguous/replay-prone and are rejected.
     */
    const uint8_t two_dp21[] = {
        0x00,0x01,
        0x15,0x00,0x00,0x06, '5','7','5','7','5','7',
        0x15,0x00,0x00,0x06, '1','2','3','4','5','6'
    };
    failures += expect_no_uart("two DP21 units", 0x00,
                               two_dp21, sizeof two_dp21);

    failures += expect_no_uart("unsupported EF00 command", 0x01,
                               valid, sizeof valid);

    printf("\n%s (%d failure%s)\n",
           failures ? "FAILURES" : "ALL PASS",
           failures, failures == 1 ? "" : "s");
    return failures ? 1 : 0;
}
