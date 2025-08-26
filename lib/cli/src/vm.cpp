#include "os.hpp"

bool trace = true;

void nop() {
    if (trace) fprintf(stderr, "nop");
}

void halt() {
    if (trace) fprintf(stderr, "halt\n\n");
    exit(0);
}
