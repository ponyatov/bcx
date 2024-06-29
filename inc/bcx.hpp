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

extern int main(int argc, char *argv[]);
extern void arg(int argc, char argv[]);

extern uint8_t M[Msz];   ///< main Memory, byte addressed
extern uint32_t R[Rsz];  ///< Return stack
extern int32_t D[Dsz];   ///< Data stack
