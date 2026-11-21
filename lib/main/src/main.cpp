
#include "bc.hpp"
#include "cli.hpp"
#include "debug.hpp"
#include "lib.hpp"
#include "main.hpp"
#include "vm.hpp"

int main(int argc, char* argv[]) {
    if (argc == 1) dap_init();
    arg(0, argv[0]);
    init(argc, argv);

    for (int i = 1; i < argc; i++) {
        arg(i, argv[i]);
        yyfile = argv[i];
        yylineno = 1;
        assert(yyin = fopen(yyfile, "r"));
        yyparse();
        fclose(yyin);
        yyfile = nullptr;
    }

    if (argc == 1)
        return dap_wait();
    else
        return vm();
}

void arg(int argc, char* argv) {  //
    info("%i: %s\n", argc, argv);
}

void init(int, char*[]) {}

int fini() { return 0; }
