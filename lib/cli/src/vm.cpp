#include "vm.hpp"
#include "libc.hpp"
#include "os.hpp"

byte M[Msz];
addr Cp = 0;
addr Ip = 0;
addr R[Rsz];
byte Rp = 0;
cell D[Dsz];
byte Dp = 0;

bool trace = true;

void nop() {
    if (trace) fprintf(stderr, "nop");
}

void halt() {
    if (trace) fprintf(stderr, "halt\n\n");
    exit(0);
}

void dump() {
    fprintf(stderr, "\n[ ");
    for (uint i = 0; i < Dp; i++) fprintf(stderr, "%i ", D[i]);
    fprintf(stderr, "\t]\n");
}

void dot() { Dp = 0; }
