#pragma once

#include "os.hpp"
#include <string>
#include <map>
#include <vector>

/// @defgroup vm vm

/// @defgroup config config
/// @ingroup vm
/// @{

/// @ref M size, @ref byte s
#define Msz 0x10000
/// @ref R size, @ref addr esses
#define Rsz 0x100
/// @ref D size, @ref cell s
#define Dsz 0x10
/// @}

/// @defgroup types types
/// @ingroup vm
/// @{
typedef uint8_t byte;
typedef uint16_t addr;
typedef int32_t cell;
/// @}

/// @defgroup memory memory
/// @ingroup vm
/// @{
extern byte M[Msz];  ///< main memory: code + data
extern addr Cp;      ///< @ref compiler pointer
extern addr Ip;      ///< instruction pointer
extern addr R[Rsz];  ///< return stack for @ref call / @ref ret
extern byte Rp;      ///< @ref R pointer
extern cell D[Dsz];  ///< data stack
extern byte Dp;      ///< @ref D pointer
/// @}

/// @defgroup command command
/// @ingroup vm
/// @{

/// command opcodes
enum class Op : byte {
    nop = 0x00,   ///<
    halt = 0xFF,  ///<
    jmp = 0x01,   ///<
    qjmp,         ///<
    call,         ///<
    ret           ///<
};

extern void nop();   ///< `( -- )` do nothing
extern void halt();  ///< `( -- )` stop system
extern void call();  ///< `(R: -- addr )` nested call
extern void ret();   ///< `(R: addr -- )` return from @ref call
extern void jmp();   ///< `( -- )` unconditional jump
extern void qjmp();  ///< `( flag -- )` jump if `false`
extern void litb();  ///< `( -- b )` push @ref byte
extern void lita();  ///< `( -- a )` push @ref addr
extern void lit();   ///< `( -- n )` push @ref cell

/// @}

/// @defgroup compiler compiler
/// @ingroup vm
/// @{
extern std::map<std::string, addr> label;  ///< known labels
extern addr compile(Op op);
extern addr compile(byte b);
extern addr compile(addr a);
extern addr compile(cell i);
/// @}

#include "syntax.hpp"
