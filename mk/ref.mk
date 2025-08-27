REF += $(HOME)/src/newlib-salsa/README
$(HOME)/src/newlib-salsa/README: /usr/src/newlib/$(NEWLIB_GZ)
	cd $(HOME)/src ; xzcat $< | tar x && touch $@

REF += $(HOME)/src/$(BINUTILS)/README
$(HOME)/src/$(BINUTILS)/README: $(DISTR)/$(BINUTILS_GZ)
	cd $(HOME)/src ; xzcat $< | tar x && touch $@

REF += $(HOME)/src/$(GCC)/README
$(HOME)/src/$(GCC)/README: $(DISTR)/$(GCC_GZ)
	cd $(HOME)/src ; xzcat $< | tar x && touch $@
