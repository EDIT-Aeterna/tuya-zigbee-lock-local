/* host_selftest.c -- validate the serial core against the doc's worked
 * examples, with no hardware. Build & run:
 *   cc -std=c99 -Wall -Wextra host_selftest.c nicki_ek_lock_serial.c -o selftest && ./selftest
 */
#include "nicki_ek_lock_serial.h"
#include <stdio.h>
#include <string.h>

static int fails = 0;
#define CHECK(cond, msg) do { if(!(cond)){ printf("FAIL: %s\n", msg); fails++; } \
                              else printf("ok  : %s\n", msg); } while(0)

/* ---- checksum vs. the doc's frames ---- */
static void test_checksums(void)
{
    struct { const uint8_t *f; size_t n; uint8_t want; const char *name; } t[] = {
        {(const uint8_t[]){0x55,0xAA,0x03,0x00,0x00,0x01,0x00,0x00}, 8, 0x03, "0x01 product-info (doc said AD -> typo; real 0x03)"},
        {(const uint8_t[]){0x55,0xAA,0x03,0x00,0x00,0x02,0x00,0x00}, 8, 0x04, "0x02 net-status query"},
        {(const uint8_t[]){0x55,0xAA,0x03,0x00,0x00,0x03,0x00,0x01,0x01}, 9, 0x07, "0x03 start-pair"},
        {(const uint8_t[]){0x55,0xAA,0x03,0x00,0x00,0x03,0x00,0x01,0x00}, 9, 0x06, "0x03 configure result ok"},
        {(const uint8_t[]){0x55,0xAA,0x03,0x00,0x00,0x24,0x00,0x00}, 8, 0x26, "0x24 time-sync request"},
    };
    for (size_t i = 0; i < sizeof(t)/sizeof(t[0]); i++)
        CHECK(tls_checksum(t[i].f, t[i].n) == t[i].want, t[i].name);
}

/* ---- DP parse: unlock enum "01 04 00 01 01" ---- */
static void test_dp_parse(void)
{
    const uint8_t data[] = {0x01,0x04,0x00,0x01,0x01};
    tls_dp_t dps[4];
    size_t n = tls_parse_dps(data, sizeof(data), dps, 4);
    CHECK(n == 1, "parse one DP unit");
    CHECK(dps[0].id == 1 && dps[0].type == TLS_DP_ENUM && dps[0].len == 1 && dps[0].value[0] == 1,
          "DP1 enum len1 value1 (unlock)");

    /* two back-to-back: bool DP8 door=1, int DP10 battery=0x0B */
    const uint8_t two[] = {0x08,0x01,0x00,0x01,0x01, 0x0A,0x02,0x00,0x04,0x00,0x00,0x00,0x0B};
    n = tls_parse_dps(two, sizeof(two), dps, 4);
    CHECK(n == 2, "parse two DP units");
    CHECK(dps[1].id == 0x0A && dps[1].type == TLS_DP_INT && dps[1].len == 4 && dps[1].value[3] == 0x0B,
          "DP10 int battery=11");
}

/* ---- end-to-end: feed frames in, capture what the module emits ---- */
static uint8_t g_tx[512]; static size_t g_txn;
static void cap_write(const uint8_t *b, size_t n){ if(g_txn+n<=sizeof(g_tx)){memcpy(g_tx+g_txn,b,n);g_txn+=n;} }
static uint32_t fixed_gmt(void){ return 0x5BF667B1; }
static int32_t  fixed_tz(void){ return 8*3600; }
static int g_dp_seen; static uint8_t g_last_dp_id; static uint32_t g_last_ts;
static void cap_dp(const tls_dp_t *dp, uint32_t ts){ g_dp_seen++; g_last_dp_id=dp->id; g_last_ts=ts; }

static void feed(tls_ctx_t *c, const uint8_t *f, size_t n){ g_txn=0; tls_rx_feed(c,f,n); }

static void test_dispatch(void)
{
    tls_hal_t hal = {0};
    hal.uart_write = cap_write; hal.gmt_now = fixed_gmt; hal.tz_offset = fixed_tz;
    hal.on_dp_report = cap_dp;
    tls_ctx_t c; tls_init(&c, &hal);

    /* MCU asks net status -> we must answer 0x06 notify with 0x03 (fake online). */
    const uint8_t q_net[] = {0x55,0xAA,0x03,0x00,0x00,0x02,0x00,0x00,0x04};
    feed(&c, q_net, sizeof(q_net));
    CHECK(g_txn >= 9 && g_tx[5]==0x06 && g_tx[8]==0x03, "net-status query -> notify GW_AND_SERVER(0x03)");

    /* MCU asks time -> we answer 0x24 with 8 bytes (std + local GMT). */
    const uint8_t q_time[] = {0x55,0xAA,0x03,0x00,0x00,0x24,0x00,0x00,0x26};
    feed(&c, q_time, sizeof(q_time));
    CHECK(g_txn==17 && g_tx[5]==0x24 && g_tx[6]==0x00 && g_tx[7]==0x08, "time-sync -> 8-byte reply");
    CHECK(g_tx[8]==0x5B&&g_tx[9]==0xF6&&g_tx[10]==0x67&&g_tx[11]==0xB1, "reply carries std GMT big-endian");

    /* MCU reports a record (timestamped unlock): flag=1, ts, DP1 int=0x0B. */
    g_dp_seen=0;
    const uint8_t rec[] = {0x55,0xAA,0x03,0x00,0x00,0x23,0x00,0x0D,
                           0x01,0x5B,0xF6,0x67,0xB1, 0x01,0x02,0x00,0x04,0x00,0x00,0x00,0x0B, 0xAE};
    feed(&c, rec, sizeof(rec));
    CHECK(g_dp_seen==1 && g_last_dp_id==0x01 && g_last_ts==0x5BF667B1, "record report -> DP1 with timestamp");

    /* Byte-at-a-time delivery must reassemble identically. */
    g_dp_seen=0;
    for (size_t i=0;i<sizeof(rec);i++) tls_rx_feed(&c,&rec[i],1);
    CHECK(g_dp_seen==1, "fragmented byte stream reassembles");

    /* "Add device" ceremony: MCU sends 0x03 start-pairing -> ack ok THEN online. */
    g_txn=0;
    const uint8_t pair[] = {0x55,0xAA,0x03,0x00,0x00,0x03,0x00,0x01,0x01,0x07};
    tls_rx_feed(&c, pair, sizeof(pair));
    /* Each 1-byte-payload frame is 10 bytes: frame1 at [0..9], frame2 at [10..19]. */
    CHECK(g_txn==20, "pairing -> two frames (0x03 ack + 0x06 online)");
    CHECK(g_tx[5]==0x03 && g_tx[8]==0x00, "0x03 configure ack result=0x00 (success)");
    CHECK(g_tx[15]==0x06, "second frame is 0x06 net-notify");
    CHECK(g_tx[18]==0x03, "net-notify status=0x03 (paired+online)");

    /* Explicit announce-online helper. */
    g_txn=0; tls_announce_online(&c);
    CHECK(g_txn==10 && g_tx[5]==0x06 && g_tx[8]==0x03, "announce_online -> 0x06 status 0x03");

    /* Boot sequence mirrors the real module: 0x01 query, then net 0x01, then 0x03. */
    g_txn=0; tls_boot(&c);
    CHECK(g_txn==9+10+10, "boot -> product_info query + two net_notify");
    CHECK(g_tx[5]==0x01 && g_tx[6]==0x00 && g_tx[7]==0x00, "boot frame1 = 0x01 product-info query (len 0)");
    CHECK(g_tx[9+5]==0x06 && g_tx[9+8]==0x01, "boot frame2 = net_notify gw(0x01)");
    CHECK(g_tx[9+10+5]==0x06 && g_tx[9+10+8]==0x03, "boot frame3 = net_notify gw+server(0x03)");

    /* Dynamic-password request with no SecKey -> reply result 0x02. */
    g_txn=0;
    const uint8_t dyn[] = {0x55,0xAA,0x03,0x00,0x00,0x07,0x00,0x01,0x00,0x0A};
    tls_rx_feed(&c, dyn, sizeof(dyn));
    CHECK(g_txn>=9 && g_tx[5]==0x07 && g_tx[8]==0x02, "dynamic-pw w/o SecKey -> 0x02 no-SecKey");
}

int main(void)
{
    test_checksums();
    test_dp_parse();
    test_dispatch();
    printf("\n%s (%d failure%s)\n", fails? "FAILURES" : "ALL PASS", fails, fails==1?"":"s");
    return fails ? 1 : 0;
}
