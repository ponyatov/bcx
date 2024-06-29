#include "bcx.hpp"

int main(int argc, char* argv[]) {
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
        assert(yyin = fopen(argv[i], "r"));
        yyparse();
        fclose(yyin);
    }
    return vm();
}

void arg(int argc, char argv[]) {  //
    fprintf(stderr, "argv[%i] = <%s>\n", argc, argv);
}

void yyerror(const char* msg) {
    fprintf(stderr, "\n\n%i: %s [%s]\n\n", yylineno, msg, yytext);
    abort();
}

uint8_t M[Msz];
uint32_t Cp = 0;
uint32_t Ip = 0;
OP op = OP::NOP;
uint32_t R[Rsz];
uint16_t Rp = 0;
int32_t D[Dsz];
uint8_t Dp = 0;

int vm() {
    while (true) {
        assert(Ip < Cp);
        op = (OP)M[Ip++];
        fprintf(stderr, "\n%.4X:\t%.2X\t", Ip - 1, op);
        switch (op) {
            case OP::NOP:
                nop();
                break;
            case OP::HALT:
                halt();
                break;
            default:
                fprintf(stderr, "???\n\n");
                abort();
        }
        // fprintf(stderr, "\n");
    }
    return 0;
}

void nop() { fprintf(stderr, "nop"); }

void halt() {
    fprintf(stderr, "halt\n\n");
    exit(0);
}

extern void cbyte(uint8_t b) {
    assert(Cp < Msz);
    M[Cp++] = b;
    fprintf(stderr, "%.4X:\t%.2X\t%s\n", Cp - 1, b, yytext);
}
