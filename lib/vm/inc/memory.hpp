/// @defgroup memory memory
/// @ingroup vm
/// @{
#pragma once

#include <assert.h>

#include "command.hpp"
#include "config.hpp"
#include "types.hpp"

extern byte M[Msz];  ///< green process memory
extern addr Cp;      ///< compiler pointer
extern addr Ip;      ///< instruction pointer

extern addr st(addr a, byte b);  ///< store @ref byte
extern addr st(addr a, Op op);   ///< store @ref Op code
extern addr st(addr a, addr c);  ///< store @ref addr
extern addr st(addr a, cell c);  ///< store @ref cell
/// @}
