BINUTILS_CFG = --target=$(TARGET) $(CCLIBS_WITH) \
				--with-sysroot=$(ROOT) --with-native-system-header-dir=/usr/include \
				--enable-lto --disable-multilib

GCC_ALL      = $(BINUTILS_CFG) --disable-bootstrap
GCC_CFG      = $(GCC_ALL) \
				--disable-shared --disable-threads \
				--without-headers --with-newlib \
				--enable-languages="c"
GPP_CFG      = $(GCC_ALL) \
				--enable-shared --enable-threads --enable-libgomp \
				--enable-languages="c,c++"

.PHONY: binutils
binutils: $(CROSS)/bin/$(TARGET)-ld
$(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README
	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install

.PHONY: gcc
gcc: $(TMP)/$(GCC)/README
	rm -rf $(TMP)/gcc ; mkdir $(TMP)/gcc ;\
	cd $(TMP)/gcc ; $(XPATH) $(TMP)/$(GCC)/$(CFG) $(GCC_CFG)
	$(MAKE) gccall

.PHONY: gccall
gccall:
	cd $(TMP)/gcc && $(XPATH) $(MAKE) -j$(CORES) all-gcc
	cd $(TMP)/gcc && $(XPATH) $(MAKE)            install-gcc
	cd $(TMP)/gcc && $(XPATH) $(MAKE) -j$(CORES) all-target-libgcc
	cd $(TMP)/gcc && $(XPATH) $(MAKE)            install-target-libgcc

.PHONY: gpp
gpp: $(TMP)/$(GCC)/README
	rm -rf $(TMP)/gcc ; mkdir $(TMP)/gcc ;\
	cd $(TMP)/gcc ; $(XPATH) $(TMP)/$(GCC)/$(CFG) $(GPP_CFG)
	$(MAKE) gccpp

.PHONY: gccpp
gccpp:
	$(MAKE) gccall
	cd $(TMP)/gcc && $(XPATH) $(MAKE) -j$(CORES) all-target-libstdc++-v3
	cd $(TMP)/gcc && $(XPATH) $(MAKE)            install-target-libstdc++-v3

.PHONY: cross
cross: cclibs binutils gcc libc gpp
