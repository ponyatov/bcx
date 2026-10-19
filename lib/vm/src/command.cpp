#include "command.hpp"

void nop() {  //
    if (debug) fprintf(stderr, "\tnop");
}

void halt() {  //
    if (debug) fprintf(stderr, "\thalt\n");
    exit(fini());
}
