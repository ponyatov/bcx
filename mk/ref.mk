REF += $(CROSS)/src/newlib-salsa/README
$(CROSS)/src/newlib-salsa/README: /usr/src/newlib/$(NEWLIB_GZ)
	cd $(CROSS)/src ; xzcat $< | tar x && touch $@

REF += $(CROSS)/src/$(GMP)/README
REF += $(CROSS)/src/$(MPFR)/README
REF += $(CROSS)/src/$(MPC)/README

REF += $(CROSS)/src/$(BINUTILS)/README
REF += $(CROSS)/src/$(GCC)/README
REF += $(CROSS)/src/$(GDB)/README
