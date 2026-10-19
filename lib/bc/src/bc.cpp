#include "bc.hpp"

char* yyfile = nullptr;

void yyerror(const char* msg) {
    fprintf(stderr, "\n\n%s:%i [%s] %s", yyfile, yylineno, yytext, msg);
    exit(-1);
}

addr compile(byte b) {
    Cp = st(Cp, b);
    return Cp;
}

addr compile(Op op) {
    Cp = st(Cp, op);
    return Cp;
}

addr compile(addr a) {
    Cp = st(Cp, a);
    return Cp;
}

addr global(std::string* label, addr a) {
    locals.clear();
    globals[*label] = a;
    Ip = a;
    if (debug) fprintf(stderr, "%.4X: %s\n", a, label->c_str());
    return a;
}

std::map<std::string, addr> globals;

addr local(std::string* label, addr a) {
    locals[*label] = a;
    if (debug) fprintf(stderr, "%.4X: %s\n", a, label->c_str());
    return a;
}

std::map<std::string, addr> locals;

addr resolve(std::string* label) {
    auto lt = locals.find(*label);
    if (lt != locals.end()) return lt->second;
    auto gt = globals.find(*label);
    if (gt != globals.end()) return gt->second;
    return forward(label, Cp);
}

std::map<std::string, std::vector<addr>> forwards;

addr forward(std::string* label, addr a) {
    forwards[*label].push_back(a);
    return a;
}

addr backpatch(std::string* label, addr a) {
    for (addr at : forwards[*label]) st(at, a);
    forwards[*label].clear();
    // forwards.remove(*label);
    return a;
}
