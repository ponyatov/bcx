CCLIBS_CFG  = --enable-static --disable-shared
CCLIBS_WITH = --with-gmp=$(CROSS) --with-mpfr=$(CROSS) --with-mpc=$(CROSS) \
				--with-isl=$(CROSS) --disable-isl-version-check

 GMP0_CFG   = $(CCLIBS_CFG) $(CCLIBS_WITH)
MPFR0_CFG   = $(CCLIBS_CFG) $(CCLIBS_WITH)
 MPC0_CFG   = $(CCLIBS_CFG) $(CCLIBS_WITH)
 ISL0_CFG   = $(CCLIBS_CFG) --with-gmp-prefix=$(CROSS)

.PHONY: cclibs0 gmp0 mpfr0 mpc0 isl0
cclibs0:        gmp0 mpfr0 mpc0 isl0

.PHONY: cclibs  gmp  mpfr  mpc  isl
cclibs:         gmp  mpfr  mpc  isl

gmp0: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a:   $(TMP)/$(GMP)/README
	rm -rf tmp/gmp ; mkdir tmp/gmp ; cd tmp/gmp ;\
	$(XPATH) $(TMP)/$(GMP)/$(CFG) $(GMP0_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) && $(XPATH) $(MAKE) install-strip

GMP_CFG = 

gmp: $(ROOT)/lib/libgmp.a
$(ROOT)/lib/libgmp.a: $(TMP)/$(GMP)/README
	rm -rf tmp/gmp ; mkdir tmp/gmp ; cd tmp/gmp ;\
	$(XPATH) $(TMP)/$(GMP)/$(TFG) $(GMP_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) && $(XPATH) $(MAKE) install-strip

mpfr0: $(CROSS)/lib/libmpfr.a
$(CROSS)/lib/libmpfr.a: $(TMP)/$(MPFR)/README
	rm -rf tmp/mpfr ; mkdir tmp/mpfr ; cd tmp/mpfr ;\
	$(XPATH) $(TMP)/$(MPFR)/$(CFG) $(MPFR0_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) && $(XPATH) $(MAKE) install-strip

MPFR_CFG = --with-gmp=$(ROOT)

mpfr: $(ROOT)/lib/libmpfr.a
$(ROOT)/lib/libmpfr.a: $(TMP)/$(MPFR)/README
	rm -rf tmp/mpfr ; mkdir tmp/mpfr ; cd tmp/mpfr ;\
	$(XPATH) $(TMP)/$(MPFR)/$(TFG) $(MPFR_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) && $(XPATH) $(MAKE) install-strip

mpc0: $(CROSS)/lib/libmpc.a
$(CROSS)/lib/libmpc.a:  $(TMP)/$(MPC)/README
	rm -rf tmp/mpc ; mkdir tmp/mpc ; cd tmp/mpc ;\
	$(XPATH) $(TMP)/$(MPC)/$(CFG) $(MPC0_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) && $(XPATH) $(MAKE) install-strip

isl0: $(CROSS)/lib/libisl.a
$(CROSS)/lib/libisl.a:  $(TMP)/$(ISL)/README
	rm -rf tmp/isl ; mkdir tmp/isl ; cd tmp/isl ;\
	$(XPATH) $(TMP)/$(ISL)/$(CFG) $(ISL0_CFG) &&\
	$(XPATH) $(MAKE) -j$(CORES) && $(XPATH) $(MAKE) install-strip
