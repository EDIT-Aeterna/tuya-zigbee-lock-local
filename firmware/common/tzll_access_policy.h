#ifndef TZLL_ACCESS_POLICY_H
#define TZLL_ACCESS_POLICY_H
#include "lock_product_binding.h"
#define TZLL_EDITION_CONTROL 0
#define TZLL_EDITION_MONITOR 1
#ifndef TZLL_ACCESS_EDITION
#define TZLL_ACCESS_EDITION TZLL_EDITION_CONTROL
#endif
#if TZLL_ACCESS_EDITION != TZLL_EDITION_CONTROL && TZLL_ACCESS_EDITION != TZLL_EDITION_MONITOR
#error "Invalid TZLL_ACCESS_EDITION"
#endif
typedef enum {
    TZLL_ACCESS_CONTROL = TZLL_EDITION_CONTROL,
    TZLL_ACCESS_MONITOR = TZLL_EDITION_MONITOR
} tzll_access_mode_t;
tzll_access_mode_t tzll_access_mode(void);
bool tzll_access_external_dp_writable(const lock_product_binding_t *binding, uint16_t dp);
#endif
