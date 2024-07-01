BINUTILS_CFG = --target=$(TARGET) \
				--with-sysroot=$(ROOT) --with-native-system-header-dir=/include \
				--disable-lto --disable-multilib

GCC_CFG      = $(BINUTILS_CFG) $(CCLIBS_WITH) --disable-bootstrap
GCC0_CFG     = $(GCC_CFG) \
				--disable-shared --disable-threads \
				--without-headers --with-newlib \
				--enable-languages="c"

.PHONY: binutils
binutils: $(CROSS)/bin/$(TARGET)-ld
$(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README
	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install

.PHONY: gcc0
gcc0: $(CROSS)/bin/$(TARGET)-gcc
$(CROSS)/bin/$(TARGET)-gcc: $(TMP)/$(GCC)/README
	cd $(TMP)/$(GCC); $(XPATH) ./$(CFG) $(GCC0_CFG)
	$(MAKE) gccall

.PHONY: gccall
gccall:
	cd $(TMP)/$(GCC) && \
	$(XPATH) $(MAKE) -j$(CORES) all-gcc
#  install-gcc
# $(MAKE) -j$(CORES) all-gcc             \
# $(MAKE)            install-gcc         \
# $(MAKE) -j$(CORES) all-target-libgcc   \
# $(MAKE)            install-target-libgcc

.PHONY: cross
cross: cclibs binutils gcc0
