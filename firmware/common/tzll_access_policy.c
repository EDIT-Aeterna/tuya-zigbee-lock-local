#include "tzll_access_policy.h"
#if defined(__GNUC__)
#define ACCESS_EXPORT __attribute__((used,noinline))
#else
#define ACCESS_EXPORT
#endif
ACCESS_EXPORT tzll_access_mode_t tzll_access_mode(void) {
    return (tzll_access_mode_t)TZLL_ACCESS_EDITION;
}
ACCESS_EXPORT bool tzll_access_external_dp_writable(const lock_product_binding_t *b, uint16_t dp) {
    /* Positive grant only. No runtime setting and no duplicated DP policy. */
    return tzll_access_mode()==TZLL_ACCESS_CONTROL && b &&
        lock_capability_dp_writable(b->capability_profile,dp);
}
