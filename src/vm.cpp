#include "vm.hpp"

int vm() { return 0; }

byte M[Msz];
uint Cp = 0;
uint Ip = 0;

addr compile(byte b) {
    M[Cp++] = b;
    return Cp;
}

void dump() {
    for (int i = 0; i < Cp; i++) {
        if (!i)
            std::clog                                             //
                << '\n'                                           //
                << std::hex << std::setw(4) << std::setfill('0')  //
                << i << ':';
        std::clog                                             //
            << ' '                                            //
            << std::hex << std::setw(2) << std::setfill('0')  //
            << (int)M[i];
    }
    std::clog << "\n\n";
}
