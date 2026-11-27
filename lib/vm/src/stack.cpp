#include "command.hpp"

extern cell pop() {  //
    assert(Dp > 0);
    return D[--Dp];
}
