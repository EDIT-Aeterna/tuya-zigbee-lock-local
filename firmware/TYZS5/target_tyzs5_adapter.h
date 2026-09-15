#ifndef TARGET_TYZS5_ADAPTER_H
#define TARGET_TYZS5_ADAPTER_H
#include "nicki_ek_lock_serial.h"
#include <string.h>

/* Donor inter-byte/ring-overflow recovery, leaving TX and wake state intact.
 * These are the frozen core's exposed RX assembly fields. */
static inline void target_tyzs5_rx_timeout(tls_ctx_t *ctx)
{
    ctx->rx_len = 0;
    ctx->rx_need = 0;
}

/* Donor EF00 DataReport: 00, transaction byte, dp, type, length BE, value. */
static inline size_t kagel_ef00_encode_dp(uint8_t *out, size_t capacity,
    uint8_t transaction, uint8_t dp, uint8_t type, const uint8_t *value, uint16_t len)
{
    if (!out || len > 256 || capacity < (size_t)len + 6 || (len && !value)) return 0;
    out[0] = 0; out[1] = transaction; out[2] = dp; out[3] = type;
    out[4] = (uint8_t)(len >> 8); out[5] = (uint8_t)len;
    if (len) memcpy(out + 6, value, len);
    return (size_t)len + 6;
}
#endif
