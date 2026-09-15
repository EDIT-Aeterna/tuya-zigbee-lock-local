#ifndef KAGEL_CONTROL_GATE_H
#define KAGEL_CONTROL_GATE_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
bool kagel_control_dp_allowed(uint8_t dp);
bool kagel_validate_dp21(const uint8_t *value, size_t len);
bool kagel_validate_dp48(const uint8_t *value, size_t len);
bool kagel_validate_dp49(const uint8_t *value, size_t len);
bool kagel_validate_temp_password_dp(uint8_t dp, const uint8_t *value, size_t len);
bool kagel_validate_dp54(const uint8_t *value, size_t len);
bool kagel_validate_dp55(const uint8_t *value, size_t len);
#endif
