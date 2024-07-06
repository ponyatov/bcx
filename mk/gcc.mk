
BINUTILS_CFG = --target=$(TARGET) --with-sysroot=$(ROOT) --disable-bootstrap \
				--with-native-system-header-dir=/usr/include \
				--enable-lto --disable-multilib \
				--enable-ld=default --enable-gold --enable-plugins \
                $(CCLIBS_WITH)
# configuring in isl error:

GCC0_CFG     = --disable-shared --disable-threads \
				--without-headers --with-newlib   \
				--enable-languages="c" --disable-gdb

GCC_CFG      = --enable-shared --enable-threads --enable-libgomp \
				--enable-languages="c,c++"

# https://raghunathlolur.wordpress.com/2014/06/30/combined-tree-build-of-gcc-binutils-and-libraries/

.PHONY: cross0 cross

# cross0: $(TMP)/gcc/gcc cclibs
# 	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
# 	$(XPATH) $(TMP)/gcc/$(CFG) $(BINUTILS_CFG) $(GCC0_CFG)
# 	$(MAKE) gcc

cross0: $(TMP)/$(GCC)/README cclibs
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(GCC)/$(CFG) $(BINUTILS_CFG) $(GCC0_CFG)
	$(XPATH) $(MAKE) gcc

# cross: $(TMP)/gcc/gcc cclibs
# 	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
# 	$(XPATH) $(TMP)/gcc/$(CFG) $(BINUTILS_CFG) $(GCC_CFG)
# # $(MAKE) gcc

cross: $(TMP)/$(GCC)/README cclibs
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/$(GCC)/$(CFG) $(BINUTILS_CFG) $(GCC_CFG)
# $(MAKE) gcc

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

$(TMP)/gcc/binutils: $(TMP)/$(BINUTILS)/README
	mkdir -p $(TMP)/gcc ; cd $(TMP)/gcc ;\
	ln -fs $(TMP)/$(BINUTILS)/* . && touch $@
$(TMP)/gcc/gcc:      $(TMP)/$(GCC)/README
	mkdir -p $(TMP)/gcc ; cd $(TMP)/gcc ;\
	ln -fs $(TMP)/$(GCC)/*      . && touch $@

# .PHONY: binutils
# binutils:
# 	cd $(TMP)/gcc-build ;\
# 	$(XPATH) $(MAKE) -j$(CORES)     all-binutils     all-ld     all-gas   &&\
# 	$(XPATH) $(MAKE)            install-binutils install-ld install-gas

.PHONY: binutils
binutils: $(CROSS)/bin/$(TARGET)-ld
$(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README cclibs
	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) &&\
	$(MAKE) -j$(CORES) && $(MAKE) install
