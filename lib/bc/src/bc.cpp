#include "bc.hpp"

char* yyfile = nullptr;

void yyerror(const char* msg) {
    fprintf(stderr, "\n\n%s:%i [%s] %s", yyfile, yylineno, yytext, msg);
    exit(-1);
}
