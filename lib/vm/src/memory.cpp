#include "memory.hpp"

byte M[Msz];
addr Cp = 0;
addr Ip = 0;

addr st(addr a, byte b) {
    assert(a + sizeof(b) < Msz);
    *(byte*)&M[a] = b;
    return a + sizeof(b);
}

addr st(addr a, Op op) {
    assert(a + sizeof(op) < Msz);
    *(Op*)&M[a] = op;
    return a + sizeof(op);
}

addr st(addr a, addr x) {
    assert(a + sizeof(x) < Msz);
    *(addr*)&M[a] = x;
    return a + sizeof(x);
}

addr st(addr a, cell c) {
    assert(a + sizeof(c) < Msz);
    *(cell*)&M[a] = c;
    return a + sizeof(c);
}
