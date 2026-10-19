#include "command.hpp"

void nop() {  //
    if (debug) fprintf(stderr, "nop");
}

void halt() {  //
    if (debug) fprintf(stderr, "halt\n");
    exit(fini());
}
