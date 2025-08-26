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
    if (trace) fprintf(stderr, "dump");
    fprintf(stderr, "\n[ ");
    for (uint i = 0; i < Dp; i++) fprintf(stderr, "%i ", D[i]);
    fprintf(stderr, "\t]\n");
}

void dot() {
    if (trace) fprintf(stderr, "dot");
    Dp = 0;
}

void dup() {
    if (trace) fprintf(stderr, "dup");
}

void drop() {
    if (trace) fprintf(stderr, "drop");
}

void swap() {
    if (trace) fprintf(stderr, "swap");
}

void over() {
    if (trace) fprintf(stderr, "over");
}

void rot() {
    if (trace) fprintf(stderr, "rot");
}

void mrot() {
    if (trace) fprintf(stderr, "dup");
}

void pick() {
    if (trace) fprintf(stderr, "pick");
}

void depth() {
    if (trace) fprintf(stderr, "depth");
    push(Dp);
}

void push(cell n) {
    assert(Dp < Dsz);
    D[Dp++] = n;
}

cell pop() {
    assert(Dp > 0);
    return D[--Dp];
}

cell top() {
    assert(Dp > 0);
    return D[Dp - 1];
}
