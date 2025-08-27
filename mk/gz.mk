GZ += /usr/src/newlib/$(NEWLIB_GZ)
/usr/src/newlib/$(NEWLIB_GZ):
	sudo apt install newlib-source

GZ += $(DISTR)/$(BINUTILS_GZ)
$(DISTR)/$(BINUTILS_GZ):
	$(CURL) $@ $(BINUTILS_URL)/$(BINUTILS_GZ)

GZ += $(DISTR)/$(GCC_GZ)
$(DISTR)/$(GCC_GZ):
	$(CURL) $@ $(GCC_URL)/$(GCC_GZ)
