/// @file
/// @brief 32-bit FORTH Virtual Machine

#pragma once

/// @defgroup config config
/// @ingroup vm
/// @{

/// @ref M main Memory size, bytes
#define Msz 0x100
/// @ref R Return stack size, cells
#define Rsz 0x10
/// Data stack size, cells
#define Dsz 0x10

/// @}

#include "inc.hpp"
#include "main.hpp"
#include "skelex.hpp"

/// @defgroup vm Virtual Machine
/// @{

/// @defgroup memory memory
/// @{
extern uint8_t M[Msz];  ///< @brief main Memory, byte addressed
extern uint32_t Cp;     ///< @brief compiler pointer / allocator
extern uint32_t Ip;     ///< @brief instruction pointer
// extern uint32_t R[Rsz];  ///< @brief Return stack
// extern uint16_t Rp;      ///< @brief return stack pointer
// extern int32_t D[Dsz];   ///< @brief Data stack
// extern uint8_t Dp;       ///< @brief data stack pointer
/// @}

extern int vm();  ///< bytecode interpreter

/// @defgroup cmd command set
/// @{
enum OP : uint8_t {  ///< command opcodes
    NOP = 0x00,
    SYNC = 0xFE,
    HALT = 0xFF,
};

/// @ingroup memory
extern OP op;  ///< @brief current opcode

extern void nop();    ///< `( -- )` empty command
extern void _sync();  ///< `( -- )` sync persistent memory (@ref HEADER)
extern void halt();   ///< `( -- )` stop whole system
/// @}

/// @defgroup compiler compiler
/// @{

struct HEADER {
    uint16_t entry = sizeof(HEADER);  ///< @ref Ip
    uint16_t heap = sizeof(HEADER);   ///< @ref Cp
    //     uint16_t latest = 0;              ///< @ref latest
};
extern HEADER *header;

extern std::map<std::string, uint32_t> label;  ///< symbol table

// extern uint16_t latest;  ///< last defined word

extern void cbyte(uint8_t b);  ///< compile byte
// extern void cshort(int16_t s);  ///< compile 16-bit short int
// extern void cint(int32_t n);    ///< compile 32-bit integer
extern void cword(char *name);  ///< compile word header

// extern void lfa();  ///< compile LFA: vocabulary link field

// /// @brief NFA: word name as byte-counted string
// /// @param[in] name short ASCIIZ string (<16 chars)
// extern void nfa(char *name);

/// @}

/// @}
