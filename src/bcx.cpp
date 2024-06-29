#include "bcx.hpp"

int main(int argc, char* argv[]) {
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
    return vm();
}

void arg(int argc, char argv[]) {  //
    fprintf(stderr, "argv[%i] = <%s>\n", argc, argv);
}

uint8_t M[Msz];
uint32_t Cp = 0;
uint32_t Ip = 0;
uint8_t op = 0;
uint32_t R[Rsz];
uint16_t Rp = 0;
int32_t D[Dsz];
uint8_t Dp = 0;

int vm() {
    op = M[Ip++];
    assert(Ip < Msz);
    fprintf(stderr, "%.4X: %.2X\t", Ip - 1, op);
    switch (op) {
        default:
            fprintf(stderr, "???\n\n");
            abort();
    }
    fprintf(stderr, "\n");
    return 0;
}
