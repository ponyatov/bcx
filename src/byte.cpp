#include "byte.hpp"

byte M[Msz];
addr Cp = 0;
addr Ip = 0;
addr R[Rsz];
byte Rp = 0;
cell D[Dsz];
byte Dp = 0;

std::map<std::string, addr> label;

addr compile(Op op) { return compile((byte)op); }

addr compile(byte b) {
    M[Cp++] = b;
    return Cp;
}

addr compile(addr a) {
    *(addr*)&M[Cp] = a;
    Cp += sizeof(a);
    return Cp;
}

addr compile(cell i) {
    *(cell*)&M[Cp] = i;
    Cp += sizeof(i);
    return Cp;
}
