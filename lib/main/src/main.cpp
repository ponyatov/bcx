
#include "bc.hpp"
#include "lib.hpp"
#include "main.hpp"

int main(int argc, char* argv[]) {
    arg(0, argv[0]);
    init(argc, argv);
    for (int i = 1; i < argc; i++) {
        arg(i, argv[i]);
        yyfile = argv[i];
        assert(yyin = fopen(yyfile, "r"));
        fclose(yyin);
        yyfile = nullptr;
    }
    return fini();
}

void arg(int argc, char* argv) {  //
    fprintf(stderr, "%i: %s\n", argc, argv);
}

void init(int, char*[]) {}

int fini() { return 0; }
