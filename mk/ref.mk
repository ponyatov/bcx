REF += $(HOME)/src/newlib-salsa/README
$(HOME)/src/newlib-salsa/README: /usr/src/newlib/$(NEWLIB_GZ)
	mkdir -p $(HOME)/src ; cd $(HOME)/src ;\
	xzcat $< | tar x && touch $@

REF += $(HOME)/src/$(BINUTILS)/README
$(HOME)/src/$(BINUTILS)/README: /usr/src/binutils/$(BINUTILS_GZ)
	mkdir -p $(HOME)/src ; cd $(HOME)/src ;\
	xzcat $< | tar x && touch $@

# $(HOME)/src/$(BINUTILS)/README: $(DISTR)/$(BINUTILS_GZ)
# 	cd $(REF) ; xzcat $< | tar x && touch $@

REF += $(HOME)/src/$(GCC)/README
$(HOME)/src/$(GCC)/README: /usr/src/gcc-12/$(GCC_GZ)
	mkdir -p $(HOME)/src ; cd $(HOME)/src ;\
	xzcat $< | tar x && touch $@

# $(HOME)/src/$(GCC)/README: $(DISTR)/$(GCC_GZ)
# 	cd $(REF) ; xzcat $< | tar x && touch $@
