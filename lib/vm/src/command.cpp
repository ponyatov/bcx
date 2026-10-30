#include "command.hpp"

void nop() {  //
    trace("\tnop");
}

void halt() {  //
    trace("\thalt\n");
    exit(fini());
}
