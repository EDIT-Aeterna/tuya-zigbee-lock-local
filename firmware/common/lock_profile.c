#include "lock_profile.h"
const lock_profile_t lock_profile_srptwvak = {"srptwvak", "srptwvak", 28800, 0, true, true, false, false};
const lock_profile_t lock_profile_ujcjk46o = {"ujcjk46o", "ujcjk46o", 28800,
    LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9, false, false, true, true};
const lock_profile_t *lock_profile_default(void) {
#if defined(LOCK_PROFILE_UJCJK46O) && LOCK_PROFILE_UJCJK46O
    return &lock_profile_ujcjk46o;
#else
    return &lock_profile_srptwvak;
#endif
}
bool lock_profile_dp_allowed(const lock_profile_t *p, uint8_t dp) {
    if (!p) return false;
    if (dp == 21 || dp == 54 || dp == 55) return true;
    if (dp >= 24 && dp <= 28) return p->temporary_passwords;
    if (dp == 48 || dp == 49) return p->password_free;
    return false;
}
