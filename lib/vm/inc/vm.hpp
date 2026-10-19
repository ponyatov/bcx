/// @defgroup vm vm
/// @ingroup lib
/// @{
#pragma once

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "command.hpp"
#include "debug.hpp"
#include "memory.hpp"

/// @brief bytecode interpeter core
/// @return fake @ref main `return 0`
extern int vm();

/// @}
