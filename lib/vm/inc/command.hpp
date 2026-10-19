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
};

extern void nop();
extern void halt();

/// @}
