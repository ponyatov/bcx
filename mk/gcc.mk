# .PHONY: cross
# cross: cclibs binutils gcc libc gpp

BINUTILS_CFG = --target=$(TARGET) --with-sysroot=$(ROOT) --disable-bootstrap \
				--with-native-system-header-dir=/usr/include \
				--enable-lto --disable-multilib \
				--enable-gold --enable-ld=default

GCC0_CFG     = --disable-shared --disable-threads \
				--without-headers --with-newlib   \
				--enable-languages="c"

# https://raghunathlolur.wordpress.com/2014/06/30/combined-tree-build-of-gcc-binutils-and-libraries/

.PHONY: cross0 cross
cross0: $(TMP)/gcc/binutils $(TMP)/gcc/gcc cclibs
	rm -rf $(TMP)/gcc-build ; mkdir $(TMP)/gcc-build ; cd $(TMP)/gcc-build ;\
	$(XPATH) $(TMP)/gcc/$(CFG) $(BINUTILS_CFG) $(GCC0_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) all-binutils               &&\
	$(XPATH) $(MAKE)            install-binutils           &&\
	$(XPATH) $(MAKE) -j$(CORES) all-gcc                    &&\
	$(XPATH) $(MAKE)            install-gcc                &&\
	$(XPATH) $(MAKE) -j$(CORES) all-target-libgcc          &&\
	$(XPATH) $(MAKE)            install-target-libgcc

cross:

$(TMP)/gcc/binutils: $(TMP)/$(BINUTILS)/README
	mkdir -p $(TMP)/gcc ; cd $(TMP)/gcc ;\
	ln -fs $(TMP)/$(BINUTILS)/* . && touch $@
$(TMP)/gcc/gcc:      $(TMP)/$(GCC)/README
	mkdir -p $(TMP)/gcc ; cd $(TMP)/gcc ;\
	ln -fs $(TMP)/$(GCC)/*      . && touch $@

# GCC_ALL      = $(BINUTILS_CFG) 
# GCC_CFG      = $(GCC_ALL) \
# 				 \
# GPP_CFG      = $(GCC_ALL) \
# 				--enable-shared --enable-threads --enable-libgomp \
# 				--enable-languages="c,c++"

# .PHONY: binutils
# binutils: $(CROSS)/bin/$(TARGET)-ld
# $(CROSS)/bin/$(TARGET)-ld: $(TMP)/$(BINUTILS)/README cclibs
# 	cd $(TMP)/$(BINUTILS); $(XPATH) ./$(CFG) $(BINUTILS_CFG) \
# 	&& $(MAKE) -j$(CORES) && $(MAKE) install

# .PHONY: gcc
# gcc: $(TMP)/$(GCC)/README cclibs
# 	rm -rf $(TMP)/gcc ; mkdir $(TMP)/gcc ;\
# 	cd $(TMP)/gcc ; $(XPATH) $(TMP)/$(GCC)/$(CFG) $(GCC_CFG)
# 	$(MAKE) gccall

# .PHONY: gccall
# gccall:
# 	cd $(TMP)/gcc && $(XPATH) $(MAKE) -j$(CORES) all-gcc
# 	cd $(TMP)/gcc && $(XPATH) $(MAKE)            install-gcc
# 	cd $(TMP)/gcc && $(XPATH) $(MAKE) -j$(CORES) all-target-libgcc
# 	cd $(TMP)/gcc && $(XPATH) $(MAKE)            install-target-libgcc

# .PHONY: gpp
# gpp: $(TMP)/$(GCC)/README cclibs
# 	rm -rf $(TMP)/gcc ; mkdir $(TMP)/gcc ;\
# 	cd $(TMP)/gcc ; $(XPATH) $(TMP)/$(GCC)/$(CFG) $(GPP_CFG)
# 	$(MAKE) gccpp

# .PHONY: gccpp
# gccpp:
# 	$(MAKE) gccall
# 	cd $(TMP)/gcc && $(XPATH) $(MAKE) -j$(CORES) all-target-libstdc++-v3
# 	cd $(TMP)/gcc && $(XPATH) $(MAKE)            install-target-libstdc++-v3
