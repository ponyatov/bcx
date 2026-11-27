#include "command.hpp"

void nop() {  //
    trace(" nop");
}

void halt() {  //
    trace(" halt\n");
    exit(fini());
}

void jmp() {  //
    Ip = lda(Ip);
    trace(" jmp  %.4X", Ip);
    assert(Ip < Cp);
}

void jz() {  //
    addr a = lda(Ip);
    trace(" jz   %.4X", a);
    if (pop()) {
        Ip = a;
        trace(">");
    } else {
        Ip += sizeof(addr);
        trace("_");
    }
}

void rpush(addr a) {
    assert(Rp < Rsz);
    R[Rp++] = a;
}

addr rpop() {
    assert(Rp > 0);
    return R[--Rp];
}

void call() {
    rpush(Ip + sizeof(addr));
    Ip = lda(Ip);
    trace(" call %.4X", Ip);
}

void ret() {
    Ip = rpop();
    trace(" ret  %.4X", Ip);
}
