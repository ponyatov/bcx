#pragma once

#include <stdint.h>

// typedef uint8_t iocell;
// typedef uint16_t iocell;
// typedef uint32_t iocell;
// typedef uint64_t iocell;

extern void xram_restart(void);
extern void xram_test(void);
extern void radzio_SDRAM_init(void);

#ifdef F429DISCO
#include "stm32f429i_discovery_sdram.h"
#include "stm32f4xx_hal.h"
#endif  // F429DISCO

#ifdef L496DISCO
#include "stm32l4xx_hal.h"
#endif  // L496DISCO

#include "uart.h"
