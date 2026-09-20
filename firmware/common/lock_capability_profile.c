#include "lock_capability_profile.h"
static const uint16_t core_dps[] = {21,54,55};
static const uint16_t extended_dps[] = {21,24,25,26,27,28,48,49,54,55};
const lock_capability_profile_t TUYA_LOCK_CAP_CORE_V1 = {
    "TUYA_LOCK_CAP_CORE_V1", LOCK_CAP_FACE_CREDENTIALS,
    core_dps, sizeof core_dps / sizeof core_dps[0]
};
const lock_capability_profile_t TUYA_LOCK_CAP_EXTENDED_V1 = {
    "TUYA_LOCK_CAP_EXTENDED_V1", LOCK_CAP_TEMPORARY_PASSWORDS | LOCK_CAP_PASSWORD_FREE,
    extended_dps, sizeof extended_dps / sizeof extended_dps[0]
};
bool lock_capability_has(const lock_capability_profile_t *p, uint64_t flag) {
    return p && flag && (p->capabilities & flag) == flag;
}
bool lock_capability_dp_writable(const lock_capability_profile_t *p, uint16_t dp) {
    /* Never infer permission from feature flags. */
    if (!p || !p->writable_dps) return false;
    for (size_t i=0;i<p->writable_dp_count;i++)
        if (p->writable_dps[i]==dp) return true;
    return false;
}
