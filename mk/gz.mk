GZ += cmake/FindSDL2.cmake cmake/FindSDL2_ttf.cmake cmake/FindSDL2_image.cmake
GZ += cmake/FindSDL2_gfx.cmake cmake/FindSDL2_mixer.cmake cmake/FindSDL2_net.cmake

cmake/FindSDL2.cmake:
	$(CURL) $@ https://github.com/aminosbh/basic-c-sdl-project/raw/refs/heads/master/cmake/sdl2/FindSDL2.cmake
cmake/FindSDL2_ttf.cmake:
	$(CURL) $@ https://github.com/aminosbh/basic-c-sdl-project/raw/refs/heads/master/cmake/sdl2/FindSDL2_ttf.cmake
cmake/FindSDL2_image.cmake:
	$(CURL) $@ https://github.com/aminosbh/basic-c-sdl-project/raw/refs/heads/master/cmake/sdl2/FindSDL2_image.cmake
cmake/FindSDL2_gfx.cmake:
	$(CURL) $@ https://github.com/aminosbh/basic-c-sdl-project/raw/refs/heads/master/cmake/sdl2/FindSDL2_gfx.cmake
cmake/FindSDL2_mixer.cmake:
	$(CURL) $@ https://github.com/aminosbh/basic-c-sdl-project/raw/refs/heads/master/cmake/sdl2/FindSDL2_mixer.cmake
cmake/FindSDL2_net.cmake:
	$(CURL) $@ https://github.com/aminosbh/basic-c-sdl-project/raw/refs/heads/master/cmake/sdl2/FindSDL2_net.cmake
