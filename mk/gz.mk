NEWLIB    = newlib-$(NEWLIB_VER)
NEWLIB_GZ = $(NEWLIB).tar.xz

GZ += /usr/src/newlib/$(NEWLIB_GZ)
/usr/src/newlib/$(NEWLIB_GZ):
	sudo apt install newlib-source

BINUTILS      = binutils-$(BINUTILS_VER)
BINUTILS_GZ   = $(BINUTILS).tar.xz
BINUTILS_URL  = https://sourceware.org/pub/binutils/releases

GZ += /usr/src/binutils/$(BINUTILS_GZ)
/usr/src/binutils/$(BINUTILS_GZ):
	sudo apt install binutils-source

$(DISTR)/$(BINUTILS_GZ):
	$(CURL) $@ $(BINUTILS_URL)/$(BINUTILS_GZ)

GCC       = gcc-$(GCC_VER)
GCC_GZ    = $(GCC)-dfsg.tar.xz
GCC_URL   = https://mirror.yandex.ru/mirrors/gnu/gcc/$(GCC)

GZ += /usr/src/gcc-12/$(GCC_GZ)
/usr/src/gcc-12/$(GCC_GZ):
	sudo apt install gcc-12-source

$(DISTR)/$(GCC_GZ):
	$(CURL) $@ $(GCC_URL)/$(GCC_GZ)
