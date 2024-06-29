/// @file
/// @brief 32-bit FORTH Virtual Machine

#pragma once

/// @defgroup config config
/// @ingroup vm
/// @{

/// @ref M main Memory size, bytes
#define Msz 0x10
/// @ref R Return stack size, cells
#define Rsz 0x10
/// Data stack size, cells
#define Dsz 0x10

/// @}

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdint.h>

/// @brief program entry point
extern int main(int argc, char *argv[]);
/// @brief dump command line argument
extern void arg(int argc, char argv[]);

/// @defgroup skelex lexical skeleton
/// @{
extern int yylex();
extern int yylineno;
extern char *yytext;
extern FILE *yyin;
extern int yyparse();
extern void yyerror(const char *msg);
#include "bcx.parser.hpp"
#define COMMAND(X)         \
    {                      \
        yylval.op = OP::X; \
        return CMD;        \
    }
/// @}

/// @defgroup vm Virtual Machine
/// @{
/// @defgroup memory memory
/// @{
extern uint8_t M[Msz];   ///< @brief main Memory, byte addressed
extern uint32_t Cp;      ///< @brief compiler pointer / allocator
extern uint32_t Ip;      ///< @brief instruction pointer
extern uint32_t R[Rsz];  ///< @brief Return stack
extern uint16_t Rp;      ///< @brief return stack pointer
extern int32_t D[Dsz];   ///< @brief Data stack
extern uint8_t Dp;       ///< @brief data stack pointer
/// @}

extern int vm();  ///< bytecode interpreter

/// @defgroup cmd command set
/// @{
enum OP : uint8_t {  ///< command opcodes
    NOP = 0x00,
    HALT = 0xFF,
};

/// @ingroup memory
extern OP op;  ///< @brief current opcode

extern void nop();   ///< `( -- )` empty command
extern void halt();  ///< `( -- )` stop whole system
/// @}

/// @defgroup compiler compiler
/// @{

extern void cbyte(uint8_t b);  ///< compile byte

/// @}

/// @}
