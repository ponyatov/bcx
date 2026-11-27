/// @defgroup memory memory
/// @ingroup vm
/// @brief memory areas & registers
/// @{
#pragma once

#include <assert.h>

#include "config.hpp"
#include "types.hpp"

extern byte M[Msz];  ///< green process memory
extern addr Cp;      ///< compiler pointer
extern addr Ip;      ///< instruction pointer

extern addr st(addr a, byte b);  ///< store @ref byte
extern addr st(addr a, addr c);  ///< store @ref addr
extern addr st(addr a, cell c);  ///< store @ref cell

extern byte ldb(addr a);  ///< load @ref byte
extern addr lda(addr a);  ///< load @ref addr
extern cell ldc(addr a);  ///< load @ref cell

extern addr R[Rsz];  ///< return stack
extern byte Rp;      ///< @ref R pointer

extern cell D[Dsz];  ///< data stack
extern byte Dp;      ///< @ref D pointer

/// @}
