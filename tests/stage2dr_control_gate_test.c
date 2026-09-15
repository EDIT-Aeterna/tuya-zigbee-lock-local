#include "kagel_control_gate.h"
#include <assert.h>
#include <stdio.h>
int main(void) {
    for (int dp=0; dp<256; ++dp) assert(kagel_control_dp_allowed((uint8_t)dp)==(dp==21));
    const uint8_t ok[]="575757", zero[]="000000", nine[]="999999";
    const uint8_t bad1[]="57575", bad2[]="5757577", bad3[]="57A757";
    assert(kagel_validate_dp21(ok,6)); assert(kagel_validate_dp21(zero,6));
    assert(kagel_validate_dp21(nine,6)); assert(!kagel_validate_dp21(bad1,5));
    assert(!kagel_validate_dp21(bad2,7)); assert(!kagel_validate_dp21(bad3,6));
    assert(!kagel_validate_dp21(NULL,0)); puts("PASS DP21-only control gate"); return 0;
}
