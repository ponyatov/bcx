#include "cli.hpp"

void repl() {
    char* line = nullptr;
    while ((line = readline("> ")) != NULL) {
        if (*line) add_history(line);
        puts(line);
        free(line);
    }
}
