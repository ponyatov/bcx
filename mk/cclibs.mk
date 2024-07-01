GCCLIBS_CFG = --disable-shared
GMP_CFG     = $(GCCLIBS_CFG)
MPFR_CFG    = $(GCCLIBS_CFG) --with-gmp=$(CROSS)

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
