CCLIBS_CFG  = --disable-shared
CCLIBS_WITH = --with-gmp=$(CROSS) --with-mpfr=$(CROSS) --with-mpc=$(CROSS)
GMP_CFG     = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPFR_CFG    = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPC_CFG     = $(CCLIBS_CFG) $(CCLIBS_WITH)

cclibs: gmp mpfr mpc

gmp: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a: $(TMP)/$(GMP)/README
	cd $(TMP)/$(GMP); ./$(CFG) $(GMP_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install

mpfr: $(CROSS)/lib/libmpfr.a
$(CROSS)/lib/libmpfr.a: $(TMP)/$(MPFR)/README
	cd $(TMP)/$(MPFR); ./$(CFG) $(MPFR_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install

mpc: $(CROSS)/lib/libmpc.a
$(CROSS)/lib/libmpc.a: $(TMP)/$(MPC)/README
	cd $(TMP)/$(MPC); ./$(CFG) $(MPC_CFG) \
	&& $(MAKE) -j$(CORES) && $(MAKE) install
