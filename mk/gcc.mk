
BINUTILS_CFG = --target=$(TARGET) $(CCLIBS_WITH) --with-sysroot=$(ROOT)  \
				--with-native-system-header-dir=/usr/include             \
				--enable-lto --disable-multilib                          \
				--enable-ld=default --enable-gold --enable-plugins

GCC_ANY      = $(BINUTILS_CFG) --disable-bootstrap                       \
				--disable-decimal-float --disable-libatomic              \
				--disable-libgomp --disable-libmpx --disable-libquadmath \
				--disable-libssp --disable-libvtv

GCC0_CFG     = $(GCC_ANY)                          \
				--disable-shared --disable-threads \
				--without-headers --with-newlib    \
				--enable-languages="c"

GCC_CFG      = $(GCC_ANY)                          \
				--enable-shared --enable-threads   \
				--enable-languages="c,c++,d"

.PHONY: cross0 cross

cross0: cclibs binutils $(CROSS)/bin/$(TARGET)-gcc
$(CROSS)/bin/$(TARGET)-gcc: $(TMP)/$(GCC)/README
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(GCC)/$(CFG) $(GCC0_CFG)
	$(MAKE) gcc
	touch $@

cross: cclibs $(CROSS)/bin/$(TARGET)-g++
$(CROSS)/bin/$(TARGET)-g++: $(TMP)/$(GCC)/README
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(GCC)/$(CFG) $(GCC_CFG)
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
$(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(BINUTILS)/$(CFG) $(BINUTILS_CFG) &&\
	$(MAKE) -j$(CORES) && $(MAKE) install
