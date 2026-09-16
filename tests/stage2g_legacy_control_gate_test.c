/*
 * Stage 2G-R reviewer: legacy control-path validator regression.
 * Reviewer-supplied. Do not modify to obtain PASS.
 *
 * Goal:
 * LOCK_MSG_REMOTE_DP must use the SAME DP-specific validators as EF00.
 * A narrow allowlist alone is not enough.
 *
 * Build:
 * gcc -std=c99 -Wall -Wextra -Werror \
 *   stage2g_legacy_control_gate_test.c \
 *   firmware/lock_app.c firmware/nicki_ek_lock_serial.c \
 *   firmware/kagel_control_gate.c -I firmware \
 *   -o /tmp/stage2g_legacy_gate
 */

#include "lock_app.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

static size_t txlen;

static void uart_write(const uint8_t *p, size_t n, void *u) {
    (void)p; (void)u; txlen += n;
}
static uint32_t gmt_now(void *u) {(void)u; return 0x6AA14285u;}
static int is_joined(void *u) {(void)u; return 1;}

static void init_app(lock_app_t *a) {
    lock_app_hal_t h;
    memset(&h, 0, sizeof h);
    h.uart_write = uart_write;
    h.gmt_now = gmt_now;
    h.is_joined = is_joined;
    txlen = 0;
    lock_app_init(a, &h);
}

static int expect_no_uart(const char *name, const uint8_t *p, size_t n) {
    lock_app_t a;
    init_app(&a);
    lock_app_zb_rx(&a, LOCK_MSG_REMOTE_DP, p, n);
    if (txlen != 0) {
        fprintf(stderr, "FAIL %-36s unexpected UART=%zu\n", name, txlen);
        return 1;
    }
    printf("PASS %-36s no UART\n", name);
    return 0;
}

static int expect_wake(const char *name, const uint8_t *p, size_t n) {
    lock_app_t a;
    init_app(&a);
    lock_app_zb_rx(&a, LOCK_MSG_REMOTE_DP, p, n);
    if (txlen != 48) {
        fprintf(stderr, "FAIL %-36s expected 3 wake writes, got=%zu\n", name, txlen);
        return 1;
    }
    printf("PASS %-36s accepted\n", name);
    return 0;
}

int main(void) {
    int f = 0;

    /* Valid regressions: retained legacy path may work, but only through same validators. */
    const uint8_t good21[] = {21,0,0,6,'1','2','3','4','5','6'};
    f += expect_wake("valid legacy DP21", good21, sizeof good21);

    const uint8_t good48[] = {
        48,0,0,21,
        1,0,1,
        0x6A,0xA1,0x7C,0x6E,
        0x72,0xBC,0x9B,0x7F,
        0xFF,0xFF,
        '4','1','0','0','1','5','4','3'
    };
    f += expect_wake("valid legacy DP48", good48, sizeof good48);

    const uint8_t good49[] = {
        49,0,0,13,
        1,0,1,'7','8','7','8','7','8','7','8',0,1
    };
    f += expect_wake("valid legacy DP49", good49, sizeof good49);

    /* These are accepted by an allowlist-only bypass, but MUST be rejected. */
    const uint8_t bad21[] = {21,0,0,6,'A','B','C','D','E','F'};
    f += expect_no_uart("legacy DP21 non-digit rejected", bad21, sizeof bad21);

    const uint8_t bad48[] = {
        48,0,0,21,
        0,0,1, /* enable=0: target validator must reject */
        0x6A,0xA1,0x7C,0x6E,
        0x72,0xBC,0x9B,0x7F,
        0xFF,0xFF,
        '4','1','0','0','1','5','4','3'
    };
    f += expect_no_uart("legacy DP48 invalid enable rejected", bad48, sizeof bad48);

    const uint8_t bad49[] = {
        49,0,0,13,
        1,0,1,'7','8','7','8','7','8','7','8',0,2 /* method != 1 */
    };
    f += expect_no_uart("legacy DP49 invalid method rejected", bad49, sizeof bad49);

    /* Existing Stage2G safety boundaries. */
    const uint8_t dp39[] = {39,0,0,6,0x03,0xE7,0,1,0,0};
    f += expect_no_uart("legacy DP39 forbidden", dp39, sizeof dp39);

    const uint8_t dp58[] = {58,0,0,4,2,0x80,3,1};
    f += expect_no_uart("legacy DP58 write forbidden", dp58, sizeof dp58);

    const uint8_t delall[] = {55,0,0,8,1,0,1,0,1,0,18,0};
    f += expect_no_uart("legacy DP55 delete-all rejected", delall, sizeof delall);

    printf("\n%s (%d failure%s)\n", f ? "FAILURES" : "ALL PASS", f, f==1 ? "" : "s");
    return f ? 1 : 0;
}
