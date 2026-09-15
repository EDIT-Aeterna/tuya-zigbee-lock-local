#include "target_tyzs5_adapter.h"
#include <assert.h>
#include <stdio.h>

int main(void)
{
    uint8_t out[262];
    const uint8_t one[] = {1}, battery[] = {0,0,0,100};
    const uint8_t door_expected[] = {0,0x42,8,1,0,1,1};
    const uint8_t battery_expected[] = {0,0x43,10,2,0,4,0,0,0,100};
    const uint8_t bell_expected[] = {0,0x44,14,1,0,1,1};
    assert(kagel_ef00_encode_dp(out,sizeof out,0x42,8,1,one,1)==7);
    assert(!memcmp(out,door_expected,7));
    assert(kagel_ef00_encode_dp(out,sizeof out,0x43,10,2,battery,4)==10);
    assert(!memcmp(out,battery_expected,10));
    assert(kagel_ef00_encode_dp(out,sizeof out,0x44,14,1,one,1)==7);
    assert(!memcmp(out,bell_expected,7));
    assert(!kagel_ef00_encode_dp(out,6,0,8,1,one,1));
    assert(!kagel_ef00_encode_dp(out,sizeof out,0,8,1,NULL,1));
    tls_ctx_t ctx = {0};
    ctx.rx_len=10; ctx.rx_need=20; ctx.pend_active=1; ctx.tx_seq=123;
    target_tyzs5_rx_timeout(&ctx);
    assert(!ctx.rx_len && !ctx.rx_need && ctx.pend_active==1 && ctx.tx_seq==123);
    puts("PASS donor EF00 DP8/DP10/DP14 payload contract and RX recovery isolation");
    return 0;
}
