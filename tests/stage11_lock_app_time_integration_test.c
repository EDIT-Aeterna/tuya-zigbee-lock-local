/* Reviewer-supplied Stage 1.1 lock_app time integration test.
 *
 * Do not modify this file to obtain PASS.
 *
 * Compile from repository root:
 *   gcc -std=c99 -Wall -Wextra -Werror \
 *       stage11_lock_app_time_integration_test.c \
 *       firmware/lock_app.c firmware/nicki_ek_lock_serial.c \
 *       -I firmware -o /tmp/stage11_lock_app_time_test
 *   /tmp/stage11_lock_app_time_test
 *
 * No hardware or SDK dependency.
 */
#include "lock_app.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint8_t txbuf[512];
static size_t txlen;

static void uart_write(const uint8_t *buf, size_t n, void *user)
{
    (void)user;
    if (txlen + n <= sizeof txbuf) {
        memcpy(txbuf + txlen, buf, n);
        txlen += n;
    }
}

static uint32_t gmt_now(void *user)
{
    (void)user;
    return 0x6AA14285u;
}

static int joined(void *user)
{
    (void)user;
    return 1;
}

static uint8_t checksum(const uint8_t *p, size_t n)
{
    unsigned sum = 0;
    for (size_t i = 0; i < n; ++i) sum += p[i];
    return (uint8_t)sum;
}

static int fail(const char *msg)
{
    fprintf(stderr, "FAIL: %s\n", msg);
    return 1;
}

int main(void)
{
    lock_app_t app;
    lock_app_hal_t hal;
    memset(&hal, 0, sizeof hal);
    hal.uart_write = uart_write;
    hal.gmt_now = gmt_now;
    hal.is_joined = joined;

    lock_app_init(&app, &hal);

    /* Target-captured MCU -> module time-sync request. */
    const uint8_t req[] = {
        0x55,0xAA,0x03,0x00,0x02,0x24,0x00,0x00,0x28
    };
    lock_app_uart_rx(&app, req, sizeof req);

    if (txlen != 17)
        return fail("expected exactly one 17-byte 0x24 response");

    const uint8_t *f = txbuf;
    if (f[0] != 0x55 || f[1] != 0xAA || f[2] != 0x03)
        return fail("bad response header/version");
    if (f[3] != 0x00 || f[4] != 0x02 || f[5] != 0x24)
        return fail("0x24 response does not preserve target request sequence");
    if (f[6] != 0x00 || f[7] != 0x08)
        return fail("0x24 response data length is not 8");

    uint32_t std =
        ((uint32_t)f[8] << 24) | ((uint32_t)f[9] << 16) |
        ((uint32_t)f[10] << 8) | f[11];
    uint32_t local =
        ((uint32_t)f[12] << 24) | ((uint32_t)f[13] << 16) |
        ((uint32_t)f[14] << 8) | f[15];

    if (std != 0x6AA14285u)
        return fail("standard timestamp != injected GMT");
    if (local - std != 28800u)
        return fail("production lock_app timezone is not UTC+8 / +28800");

    if (checksum(f, 16) != f[16])
        return fail("bad response checksum");

    /* Exact target-capture response for the injected GMT. */
    const uint8_t expected[] = {
        0x55,0xAA,0x03,0x00,0x02,0x24,0x00,0x08,
        0x6A,0xA1,0x42,0x85,0x6A,0xA1,0xB3,0x05,0xC5
    };
    if (memcmp(f, expected, sizeof expected) != 0)
        return fail("response differs from target-captured UTC+8 golden");

    puts("PASS lock_app production time integration: exact target 0x24 UTC+8 response");
    return 0;
}
