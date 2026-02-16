#include "app.hpp"

int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
}

void arg(int argc, char *argv) {  //
    std::clog << "arg[" << argc << "] = <" << argv << "]\n";
}
