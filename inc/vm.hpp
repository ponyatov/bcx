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

/// @ref M size, @ref byte s
#define Msz 0x10000
/// @ref R size, @ref addr esses
#define Rsz 0x100
/// @ref D ize, @ref cell s
#define Dsz 0x10

extern byte M[Msz];  ///< main memory
extern uint Cp;      ///< compiler pointer
extern uint Ip;      ///< instruction pointer

extern addr compile(byte b);

extern void dump();
