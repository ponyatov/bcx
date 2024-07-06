
BINUTILS_CFG = --target=$(TARGET) --with-sysroot=$(ROOT) --disable-bootstrap \
				--with-native-system-header-dir=/usr/include \
				--enable-lto --disable-multilib \
				--enable-ld=default --enable-gold --enable-plugins \
                $(CCLIBS_WITH)

GCC0_CFG     = --disable-shared --disable-threads \
				--without-headers --with-newlib   \
				--enable-languages="c" --disable-gdb

GCC_CFG      = --enable-shared --enable-threads --enable-libgomp \
				--enable-languages="c,c++"

.PHONY: cross0 cross

cross0: $(TMP)/$(GCC)/README cclibs binutils
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(GCC)/$(CFG) $(BINUTILS_CFG) $(GCC0_CFG)
	$(XPATH) $(MAKE) gcc

cross: $(TMP)/$(GCC)/README cclibs
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(GCC)/$(CFG) $(BINUTILS_CFG) $(GCC_CFG)
	$(MAKE) gcc

.PHONY: gcc
gcc:
	cd $(TMP)/gcc-build ;\
	$(XPATH) $(MAKE) -j$(CORES)     all-gcc           &&\
	$(XPATH) $(MAKE)            install-gcc           &&\
	$(XPATH) $(MAKE) -j$(CORES)     all-target-libgcc &&\
	$(XPATH) $(MAKE)            install-target-libgcc

.PHONY: gpp
gpp:
	cd $(TMP)/gcc-build ;\
	$(XPATH) $(MAKE) -j$(CORES)     all-target-libstdc++-v3 &&\
	$(XPATH) $(MAKE)            install-target-libstdc++-v3

.PHONY: binutils
binutils: $(CROSS)/bin/$(TARGET)-ld
$(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README cclibs
	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) &&\
	$(MAKE) -j$(CORES) && $(MAKE) install
