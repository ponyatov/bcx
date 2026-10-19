/// @defgroup command command
/// @ingroup vm
/// @{
#pragma once

#include <stdio.h>
#include <stdlib.h>

#include "debug.hpp"
#include "main.hpp"
#include "types.hpp"

enum class Op : byte {
    nop = 0x00,   ///< @ref nop
    halt = 0xFF,  ///< @ref halt
    jmp = 0x01,   ///< @ref jmp
    jz = 0x02,    ///< @ref jz
    call = 0x03,  ///< @ref call
    ret = 0x04,   ///< @ref ret

};

extern void nop();
extern void halt();

/// @}
