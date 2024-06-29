/// @file
/// @brief 32-bit FORTH Virtual Machine

#pragma once

/// Memory size, bytes
#define Msz 0x10000
/// Return stack size, cells
#define Rsz 0x100
/// Data stack size, cells
#define Dsz 0x10

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdint.h>

/// @brief program entry point
extern int main(int argc, char *argv[]);
/// @brief dump command line argument
extern void arg(int argc, char argv[]);

extern uint8_t M[Msz];   ///< main Memory, byte addressed
extern uint32_t Cp;      ///< compiler pointer / allocator
extern uint32_t Ip;      ///< instruction pointer
extern uint8_t op;       ///< current opcode
extern uint32_t R[Rsz];  ///< Return stack
extern uint16_t Rp;      ///< return stack pointer
extern int32_t D[Dsz];   ///< Data stack
extern uint8_t Dp;       ///< data stack pointer

extern int vm();  ///< bytecode interpreter
