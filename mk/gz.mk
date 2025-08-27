GZ += /usr/src/newlib/$(NEWLIB_GZ)
/usr/src/newlib/$(NEWLIB_GZ):
	sudo apt install newlib-source

GZ += /usr/src/binutils/$(BINUTILS_GZ)
/usr/src/binutils/$(BINUTILS_GZ):
	sudo apt install binutils-source

$(DISTR)/$(BINUTILS_GZ):
	$(CURL) $@ $(BINUTILS_URL)/$(BINUTILS_GZ)

GZ += /usr/src/gcc-12/$(GCC_GZ)
/usr/src/gcc-12/$(GCC_GZ):
	sudo apt install gcc-12-source

$(DISTR)/$(GCC_GZ):
	$(CURL) $@ $(GCC_URL)/$(GCC_GZ)
