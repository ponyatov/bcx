#include "vm.hpp"

int vm() {
    while (true) {
        if (debug) fprintf(stderr, "\n%.4X: ", Ip);
        assert(Ip < Cp);
        Op op = (Op)M[Ip++];
        if (debug) fprintf(stderr, "%.2X ", (byte)op);
        switch (op) {
            case Op::nop:
                nop();
                break;
            case Op::halt:
                halt();
                break;
            default:
                if (debug) fprintf(stderr, "???\n");
                abort();
        }
    }
    return 0;
}
