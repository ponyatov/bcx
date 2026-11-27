#include "memory.hpp"

byte M[Msz];
addr Cp = 0;
addr Ip = 0;

addr st(addr a, byte b) {
    assert(a + sizeof(b) < Msz);
    *(byte*)&M[a] = b;
    return a + sizeof(b);
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

addr lda(addr a) {
    assert(a + sizeof(addr) < Msz);
    return *(addr*)&M[a];
}

addr R[Rsz];
byte Rp = 0;

cell D[Dsz];
byte Dp = 0;
