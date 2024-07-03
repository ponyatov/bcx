CCLIBS_CFG  = --enable-static --disable-shared
CCLIBS_WITH = --with-gmp=$(CROSS) --with-mpfr=$(CROSS) --with-mpc=$(CROSS) \
				--with-isl=$(CROSS) --with-cloog=$(CROSS)
GMP_CFG     = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPFR_CFG    = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPC_CFG     = $(CCLIBS_CFG) $(CCLIBS_WITH)

ISL_CFG   = $(CCLIBS_CFG) --with-gmp-prefix=$(CROSS)
CLOOG_CFG = $(ISL_CFG)

.PHONY: cclibs gmp mpfr mpc isl cloog
cclibs: gmp mpfr mpc isl cloog

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

cloog: $(CROSS)/lib/libcloog-isl.a
$(CROSS)/lib/libcloog-isl.a: $(TMP)/$(CLOOG)/README
	cd $(TMP)/$(CLOOG); ./$(CFG) $(CLOOG_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install-strip
