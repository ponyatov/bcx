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
uint32_t Cp = sizeof(HEADER);
uint32_t Ip = sizeof(HEADER);
OP op = OP::NOP;
uint32_t R[Rsz];
uint16_t Rp = 0;
int32_t D[Dsz];
uint8_t Dp = 0;

int vm() {
    header->latest = 0;
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

void cbyte(uint8_t b) {
    assert(Cp < Msz);
    M[Cp++] = b;
    // fprintf(stderr, "%.4X:\t%.2X\t%s\n", Cp - 1, b, yytext);
    header->heap = Cp;
}

extern void cint(int32_t n) {
    *(uint32_t*)(&M[Cp]) = n;
    Cp += sizeof(n);
    header->heap = Cp;
    fprintf(stderr, "%.4X\t%.8X\n", Cp - sizeof(n), n);
}

std::map<std::string, uint32_t> label;

HEADER* header = (HEADER*)&M;

void lfa() {
    uint32_t latest = header->latest;
    header->latest = Cp;
    cint(latest);
}

void nfa(char* name) {
    size_t len = strlen(name); assert(len<0x10);
    cbyte(strlen(name));
    for(int i=0;i<len;i++) cbyte(name[i]);
}

void afa(uint8_t attr = 0) { cbyte(attr); }

void cfa(uint32_t addr) {}

extern void cword(char* name) {
    lfa();
    nfa(name);
    afa();
    cfa(Cp);
    label[name] = Cp;
    Ip = Cp;
    header->heap = Cp;
}
