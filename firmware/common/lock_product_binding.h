#ifndef LOCK_PRODUCT_BINDING_H
#define LOCK_PRODUCT_BINDING_H
#include "lock_capability_profile.h"
#include "nicki_ek_lock_serial.h"

/* A PID is a Tuya product definition, never module identity/protocol version. */
typedef struct {
    const char *name;
    const char *pid;
    const char *tested_mcu_version; /* evidence only; not a new version gate */
    const lock_capability_profile_t *capability_profile;
    uint32_t quirks;
    bool require_pid_match_for_writes;
    /* TODO: timezone is deployment/site configuration, not product capability. */
    int32_t timezone_offset_seconds;
} lock_product_binding_t;

/* Runtime state, distinct from immutable binding metadata. */
typedef struct {
    bool received;
    bool valid; /* latest JSON has valid product identity; not write authorization */
    bool ota_flag_present;
    bool ota_capable;
    char pid[17];
    char mcu_version[17];
} lock_product_observation_t;

extern const lock_product_binding_t lock_binding_srptwvak;
extern const lock_product_binding_t lock_binding_ujcjk46o;
const lock_product_binding_t *lock_binding_default(void);
bool lock_binding_has_quirk(const lock_product_binding_t *binding, uint32_t quirk);
bool lock_binding_requires_pid_match(const lock_product_binding_t *binding);
bool lock_binding_pid_matches(const lock_product_binding_t *binding, const char *pid, size_t len);
bool lock_product_observe(lock_product_observation_t *observation, const char *json,
                          size_t len, bool ota_flag_present, bool ota_capable);
#endif
