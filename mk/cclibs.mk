CCLIBS_CFG  = --enable-static --disable-shared
CCLIBS_WITH = --with-gmp=$(CROSS) --with-mpfr=$(CROSS) --with-mpc=$(CROSS)
				--with-isl=$(CROSS) --with-cloog=$(CROSS)

GMP_CFG     = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPFR_CFG    = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPC_CFG     = $(CCLIBS_CFG) $(CCLIBS_WITH)
ISL_CFG     = $(CCLIBS_CFG) --with-gmp-prefix=$(CROSS)
CLOOG_CFG   = $(ISL_CFG)

.PHONY: cclibs gmp mpfr mpc graphite
cclibs: gmp mpfr mpc graphite

gmp: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a: $(TMP)/$(GMP)/README
	cd $(TMP)/$(GMP); ./$(CFG) $(GMP_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install-strip

mpfr: $(CROSS)/lib/libmpfr.a
$(CROSS)/lib/libmpfr.a: $(TMP)/$(MPFR)/README
	cd $(TMP)/$(MPFR); ./$(CFG) $(MPFR_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install-strip

mpc: $(CROSS)/lib/libmpc.a
$(CROSS)/lib/libmpc.a: $(TMP)/$(MPC)/README
	cd $(TMP)/$(MPC); ./$(CFG) $(MPC_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install-strip

isl: $(CROSS)/lib/libisl.a
$(CROSS)/lib/libisl.a: $(TMP)/$(ISL)/README
	cd $(TMP)/$(ISL); ./$(CFG) $(ISL_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install-strip

# cloog: $(CROSS)/lib/libcloog-isl.a
# $(CROSS)/lib/libcloog-isl.a: $(TMP)/$(CLOOG)/README
# 	cd $(TMP)/$(CLOOG); ./$(CFG) $(CLOOG_CFG) \
# 	&& $(MAKE) -j$(CORES) && $(MAKE) install-strip

# cd $(TMP)/$(GCC) ; ./contrib/download_prerequisites --graphite && touch $@
graphite: isl
# $(TMP)/$(BINUTILS)/isl/README $(TMP)/$(GCC)/isl/README

$(TMP)/$(BINUTILS)/isl/README: $(TMP)/$(BINUTILS)/README $(TMP)/$(ISL)/README
	ln -fs $(TMP)/$(ISL)       $(TMP)/$(BINUTILS)/isl    && touch $@
$(TMP)/$(GCC)/isl/README:      $(TMP)/$(GCC)/README      $(TMP)/$(ISL)/README
	ln -fs $(TMP)/$(ISL)       $(TMP)/$(GCC)/isl         && touch $@
# https://raghunathlolur.wordpress.com/2014/06/30/combined-tree-build-of-gcc-binutils-and-libraries/
