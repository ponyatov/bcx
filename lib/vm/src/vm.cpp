#include "vm.hpp"

int vm() {
    info("\nvm:\n");
    while (true) {
        trace( "\n%.4X: ", Ip);
        assert(Ip < Cp);
        Op op = (Op)M[Ip++];
        trace( "%.2X ", (byte)op);
        switch (op) {
            case Op::nop:
                nop();
                break;
            case Op::halt:
                halt();
                break;
            default:
                trace( "???\n");
                abort();
        }
    }
    return 0;
}
