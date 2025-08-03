# SDL2 detection
# https://github.com/aminosbh/basic-c-sdl-project/tree/master/cmake/sdl2
find_package(SDL2 REQUIRED)
include_directories(
    ${SDL2_INCLUDE_DIRS}
    ${SDL2_TTF_INCLUDE_DIRS}
    ${SDL2_IMAGE_INCLUDE_DIRS}
)
