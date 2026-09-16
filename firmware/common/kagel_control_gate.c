#include "kagel_control_gate.h"
#include "lock_profile.h"
#if defined(__GNUC__)
# define KAGEL_EXPORT __attribute__((used, noinline))
#else
# define KAGEL_EXPORT
#endif
KAGEL_EXPORT bool kagel_control_dp_allowed(uint8_t dp) {
    return lock_profile_dp_allowed(lock_profile_default(), dp);
}
bool kagel_validate_dp21(const uint8_t *value, size_t len) {
    if (!value || len != 6u) return false;
    for (size_t i = 0; i < 6u; ++i)
        if (value[i] < (uint8_t)'0' || value[i] > (uint8_t)'9') return false;
    return true;
}
bool kagel_validate_dp48(const uint8_t *value, size_t len) {
    if (!value || len != 21u || value[0] != 1u ||
        value[1] != 0u || value[2] != 1u ||
        value[11] != 0xFFu || value[12] != 0xFFu) return false;
    uint32_t start = ((uint32_t)value[3] << 24) | ((uint32_t)value[4] << 16) |
                     ((uint32_t)value[5] << 8) | value[6];
    uint32_t end = ((uint32_t)value[7] << 24) | ((uint32_t)value[8] << 16) |
                   ((uint32_t)value[9] << 8) | value[10];
    if (start >= end) return false;
    for (size_t i = 13; i < 21; ++i)
        if (value[i] < (uint8_t)'0' || value[i] > (uint8_t)'9') return false;
    return true;
}
bool kagel_validate_dp49(const uint8_t *value, size_t len) {
    if (!value || len != 13u || value[0] != 1u || value[1] != 0u || value[2] != 1u ||
        value[11] != 0u || value[12] != 1u) return false;
    for (size_t i = 3; i < 11; ++i)
        if (value[i] < (uint8_t)'0' || value[i] > (uint8_t)'9') return false;
    return true;
}
static bool digits6(const uint8_t *p) {
    for (size_t i = 0; i < 6u; ++i)
        if (p[i] < (uint8_t)'0' || p[i] > (uint8_t)'9') return false;
    return true;
}
static uint32_t be32(const uint8_t *p) {
    return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8) | p[3];
}
bool kagel_validate_temp_password_dp(uint8_t dp, const uint8_t *value, size_t len) {
    if (!value) return false;
    if (dp == 24u) {
        return len == 27u && be32(value + 6) < be32(value + 10) &&
               (value[20] == 0u || value[20] == 1u) &&
               value[14] == 0u && value[15] == 0u && value[16] == 0u &&
               value[17] == 0u && value[18] == 0u && value[19] == 0u &&
               digits6(value + 21);
    }
    if (dp == 26u) {
        return len == 27u && be32(value + 6) < be32(value + 10) &&
               (value[20] == 0u || value[20] == 1u) &&
               value[14] == 0u && value[15] == 0u && value[16] == 0u &&
               value[17] == 0u && value[18] == 0u && value[19] == 0u &&
               digits6(value + 21);
    }
    return (dp == 25u || dp == 27u || dp == 28u) && len == 6u;
}
KAGEL_EXPORT bool kagel_validate_dp54(const uint8_t *v, size_t n) {
    return v && n == 7u && v[0] >= 1u && v[0] <= 3u &&
           (v[1] == 0u || v[1] == 0xFEu) && v[2] == 1u && v[3] == 0u &&
           v[4] == 1u && v[5] == 3u && v[6] == 0xE7u;
}
KAGEL_EXPORT bool kagel_validate_dp55(const uint8_t *v, size_t n) {
    unsigned id;
    if (!v || n != 8u || v[0] < 1u || v[0] > 3u || v[1] != 0u || v[2] != 1u ||
        v[3] != 0u || v[4] != 1u || v[7] != 1u) return false;
    id = ((unsigned)v[5] << 8) | v[6];
    return id >= 1u && id <= 999u;
}
