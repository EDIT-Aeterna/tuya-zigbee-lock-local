/* kagel_rx_timeout.h -- portable tick arithmetic for UART RX gap checks. */
#ifndef KAGEL_RX_TIMEOUT_H
#define KAGEL_RX_TIMEOUT_H

#include <stdint.h>

/* The configured interval is short enough that signed subtraction remains
 * valid across a 32-bit tick counter wrap. */
static inline int kagel_rx_timeout_due(uint32_t now_tick, uint32_t last_tick,
                                       uint32_t timeout_ticks)
{
    return timeout_ticks != 0 &&
           (int32_t)(now_tick - last_tick) >= (int32_t)timeout_ticks;
}

#endif /* KAGEL_RX_TIMEOUT_H */
