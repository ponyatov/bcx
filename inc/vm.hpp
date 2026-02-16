#pragma once

#include "app.hpp"

typedef uint8_t byte;   ///< single byte (u16)
typedef int32_t cell;   ///< signed integer (MCU-limited: 32bit)
typedef uint16_t addr;  ///< virtual memory address (16 bit, 64K max)
typedef uint32_t phys;  ///< physical memory address (MCU)

extern int vm();

enum class op {
    nop = 0x00,
    halt = 0xff,
    jmp = 0x01,
};
