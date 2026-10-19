/// @defgroup command command
/// @ingroup vm
/// @{

#include "types.hpp"

enum class Op : byte {
    nop = 0x00,
    halt = 0xFF,
};

/// @}
