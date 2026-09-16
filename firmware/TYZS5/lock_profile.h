#ifndef LOCK_PROFILE_H
#define LOCK_PROFILE_H
#include <stdint.h>
#include <stdbool.h>
#include "nicki_ek_lock_serial.h"
typedef struct {
    const char *name;
    const char *expected_pid;
    int32_t timezone_offset_seconds;
    uint32_t quirks;
    bool temporary_passwords;
    bool password_free;
    bool face_credentials;
} lock_profile_t;
extern const lock_profile_t lock_profile_srptwvak;
extern const lock_profile_t lock_profile_ujcjk46o;
const lock_profile_t *lock_profile_default(void);
bool lock_profile_dp_allowed(const lock_profile_t *profile, uint8_t dp);
#endif
