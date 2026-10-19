/// @defgroup command command
/// @ingroup vm
/// @{

#include <stdint.h>

enum class Op : uint8_t {
    nop = 0x00,
    halt = 0xFF,
};

/// @}
