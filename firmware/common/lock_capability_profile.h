#ifndef LOCK_CAPABILITY_PROFILE_H
#define LOCK_CAPABILITY_PROFILE_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/* TZLL internal policy names, not official Tuya protocol generations. */
#define LOCK_CAP_TEMPORARY_PASSWORDS (UINT64_C(1) << 0)
#define LOCK_CAP_PASSWORD_FREE       (UINT64_C(1) << 1)
#define LOCK_CAP_FACE_CREDENTIALS    (UINT64_C(1) << 2)
typedef struct {
    const char *name;
    uint64_t capabilities;
    const uint16_t *writable_dps;
    size_t writable_dp_count;
} lock_capability_profile_t;
extern const lock_capability_profile_t TUYA_LOCK_CAP_CORE_V1;
extern const lock_capability_profile_t TUYA_LOCK_CAP_EXTENDED_V1;
bool lock_capability_has(const lock_capability_profile_t *profile, uint64_t flag);
bool lock_capability_dp_writable(const lock_capability_profile_t *profile, uint16_t dp);
#endif
