BINUTILS_CFG = --target=$(TARGET) \
				--with-sysroot=$(ROOT) --with-native-system-header-dir=/include \
				--disable-lto --disable-multilib

GCC_CFG      = $(BINUTILS_CFG) $(CCLIBS_WITH)

gcc: $(GZ)/$(GCC_GZ)

binutils: $(CROSS)/bin/ld
$(CROSS)/bin/ld: $(TMP)/$(BINUTILS)/README
	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install && touch $@
