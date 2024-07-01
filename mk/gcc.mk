BINUTILS_CFG = --target=$(TARGET) \
				--with-sysroot=$(ROOT) --with-native-system-header-dir=/usr/include \
				--disable-lto --disable-multilib

GCC_ALL      = $(BINUTILS_CFG) $(CCLIBS_WITH) --disable-bootstrap
GCC0_CFG     = $(GCC_ALL) \
				--disable-shared --disable-threads \
				--without-headers --with-newlib \
				--enable-languages="c"
GCC_CFG      = $(GCC_ALL) \
				--enable-shared --enable-threads \
				--enable-languages="c"

.PHONY: binutils
binutils: $(CROSS)/bin/$(TARGET)-ld
$(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README
	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install

.PHONY: gcc0
gcc0: $(TMP)/$(GCC)/README
	rm -rf $(TMP)/gcc ; mkdir $(TMP)/gcc ;\
	cd $(TMP)/gcc ; $(XPATH) $(TMP)/$(GCC)/$(CFG) $(GCC0_CFG)
	$(MAKE) gccall

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

.PHONY: cross
cross: cclibs binutils gcc0 libc gcc
