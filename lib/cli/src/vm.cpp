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
    push(top());
}

void drop() {
    if (trace) fprintf(stderr, "drop");
    pop();
}

void swap() {
    if (trace) fprintf(stderr, "swap");
    cell b = pop();
    cell a = pop();
    push(b);
    push(a);
}

void over() {
    if (trace) fprintf(stderr, "over");
    cell b = pop();
    cell a = pop();
    push(a);
    push(b);
    push(a);
}

void rot() {
    if (trace) fprintf(stderr, "rot");
    cell c = pop();
    cell b = pop();
    cell a = pop();
    push(b);
    push(c);
    push(a);
}

void mrot() {
    if (trace) fprintf(stderr, "mrot");
    cell c = pop();
    cell b = pop();
    cell a = pop();
    push(c);
    push(a);
    push(b);
}

void pick() {
    if (trace) fprintf(stderr, "pick");
    assert(Dp >= 2);
    cell i = pop();
    push(D[Dp - 1 - i]);
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
