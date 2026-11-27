#include "vm.hpp"

int vm() {
    info("\nvm:\n");
    for (uint16_t tick = 0; tick < 0x10; tick++) {
    // while (true) {
        trace("\n%.4X: ", Ip);
        assert(Ip < Cp);
        Op op = (Op)M[Ip++];
        trace("%.2X", (byte)op);
        switch (op) {
            case Op::nop:
                nop();
                break;
            case Op::halt:
                halt();
                break;
            case Op::jmp:
                jmp();
                break;
            case Op::jz:
                jz();
                break;
            case Op::call:
                call();
                break;
            case Op::ret:
                ret();
                break;
            default:
                trace("???\n");
                abort();
        }
    }
    return 0;
}
