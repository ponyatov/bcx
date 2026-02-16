
# file(GLOB LD -> cmake/any_toolchain.cmake

file(GLOB_RECURSE S
    RELATIVE ${CMAKE_SOURCE_DIR} CONFIGURE_DEPENDS
    src/*.s
)

file(GLOB_RECURSE C
    RELATIVE ${CMAKE_SOURCE_DIR} CONFIGURE_DEPENDS
    src/*.c*
)

file(GLOB_RECURSE H
    RELATIVE ${CMAKE_SOURCE_DIR} CONFIGURE_DEPENDS
    inc/*.h*
)

file(GLOB INC
    RELATIVE ${CMAKE_SOURCE_DIR} CONFIGURE_DEPENDS
    ${CMAKE_BINARY_DIR}
    inc src
)
include_directories(${INC})

file(GLOB INI
    RELATIVE ${CMAKE_SOURCE_DIR} CONFIGURE_DEPENDS
    lib/*.ini lib/*.f
)
