/* kagel_profile.h -- explicit build-time safety/profile selection. */
#ifndef KAGEL_PROFILE_H
#define KAGEL_PROFILE_H

#include <stdint.h>
#include "tzll_access_policy.h"

/* The legacy/default profile remains full-control TYZS3 behavior. Select the
 * TYZS5 first-hardware profile with:
 *   -DKAGEL_PROFILE=KAGEL_PROFILE_TYZS5_SRPTWVAK
 * KAGEL_TELEMETRY_ONLY=1 is accepted as an equivalent build flag. */
#define KAGEL_PROFILE_TYZS3_FULL_CONTROL 0
#define KAGEL_PROFILE_TYZS5_SRPTWVAK      1
#define KAGEL_PROFILE_TYZS3_HARDENED       2

#define KAGEL_BASIC_MANUFACTURER "Tuya"
#if KAGEL_PROFILE == KAGEL_PROFILE_TYZS3_HARDENED
# if TZLL_ACCESS_EDITION == TZLL_EDITION_MONITOR
#  define KAGEL_BASIC_MODEL "TY0A01-TYZS3-MON"
#  define KAGEL_FW_VERSION "T3-1-MON"
# else
#  define KAGEL_BASIC_MODEL "TY0A01-TYZS3"
#  define KAGEL_FW_VERSION "T3-1"
# endif
# define KAGEL_BOOTLOADER_PROBE 0
#else
# if TZLL_ACCESS_EDITION == TZLL_EDITION_MONITOR
#  define KAGEL_BASIC_MODEL "TY0A01-TYZS5-MON"
#  define KAGEL_FW_VERSION "1.0.2-MON"
# else
#  define KAGEL_BASIC_MODEL "TY0A01-TYZS5"
#  define KAGEL_FW_VERSION "1.0.2"
# endif
# define KAGEL_BOOTLOADER_PROBE 1
#endif

#if defined(KAGEL_REQUIRE_TYZS3_PROFILE) && KAGEL_REQUIRE_TYZS3_PROFILE
# if !defined(KAGEL_PROFILE) || KAGEL_PROFILE != KAGEL_PROFILE_TYZS3_HARDENED
#  error "TYZS3 candidate requires hardened module profile"
# endif
#endif

#if defined(KAGEL_REQUIRE_EXPLICIT_PROFILE) && KAGEL_REQUIRE_EXPLICIT_PROFILE \
    && !defined(KAGEL_PROFILE)
# error "This target requires an explicit KAGEL_PROFILE"
#endif

#if defined(KAGEL_REQUIRE_TYZS5_PROFILE) && KAGEL_REQUIRE_TYZS5_PROFILE
# if !defined(KAGEL_PROFILE)
#  error "This target requires KAGEL_PROFILE_TYZS5_SRPTWVAK"
# elif KAGEL_PROFILE != KAGEL_PROFILE_TYZS5_SRPTWVAK
#  error "This target only permits KAGEL_PROFILE_TYZS5_SRPTWVAK"
# endif
#endif

#if !defined(KAGEL_PROFILE)
# if defined(KAGEL_TELEMETRY_ONLY) && KAGEL_TELEMETRY_ONLY
#  define KAGEL_PROFILE KAGEL_PROFILE_TYZS5_SRPTWVAK
# else
#  define KAGEL_PROFILE KAGEL_PROFILE_TYZS3_FULL_CONTROL
# endif
#endif

#if KAGEL_PROFILE != KAGEL_PROFILE_TYZS3_FULL_CONTROL && \
    KAGEL_PROFILE != KAGEL_PROFILE_TYZS5_SRPTWVAK && \
    KAGEL_PROFILE != KAGEL_PROFILE_TYZS3_HARDENED
# error "Unsupported KAGEL_PROFILE"
#endif

#if KAGEL_PROFILE == KAGEL_PROFILE_TYZS5_SRPTWVAK || KAGEL_PROFILE == KAGEL_PROFILE_TYZS3_HARDENED
# if defined(KAGEL_TELEMETRY_ONLY) && !KAGEL_TELEMETRY_ONLY
#  error "TYZS5 profile must be telemetry-only"
# endif
# if !defined(KAGEL_TELEMETRY_ONLY)
#  define KAGEL_TELEMETRY_ONLY 1
# endif
#else
# if defined(KAGEL_TELEMETRY_ONLY) && KAGEL_TELEMETRY_ONLY
#  error "TYZS3 full-control profile cannot be telemetry-only"
# endif
# if !defined(KAGEL_TELEMETRY_ONLY)
#  define KAGEL_TELEMETRY_ONLY 0
# endif
#endif

#if KAGEL_PROFILE == KAGEL_PROFILE_TYZS5_SRPTWVAK
# define KAGEL_BUILD_IDENTITY "KAGEL-TYZS5-SRPTWVAK-STAGE2G"
#elif KAGEL_PROFILE == KAGEL_PROFILE_TYZS3_HARDENED
# define KAGEL_BUILD_IDENTITY "TZLL-TYZS3-UJCJK46O-T3-1-CANDIDATE"
#else
# define KAGEL_BUILD_IDENTITY "KAGEL-TYZS3-FULL-CONTROL"
#endif

/* DP205 is a local module-OTA trigger, not lock-MCU telemetry. */
static inline int kagel_profile_allows_module_ota_trigger(uint8_t dp_id)
{
    return !KAGEL_TELEMETRY_ONLY && dp_id == 205;
}

#endif /* KAGEL_PROFILE_H */
