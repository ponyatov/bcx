HW ?= pc

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk

.PHONY: cross
cross: $(CROSS)/.gitignore $(ROOT)/.gitignore binutils
$(CROSS)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@
$(ROOT)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@

.PHONY: binutils

BINUTILS_CFG += --disable-nls --target=$(TARGET)
BINUTILS_CFG += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
BINUTILS_CFG += --enable-lto --disable-multilib

binutils: $(HOME)/src/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) ; mkdir $(TMP)/$(BINUTILS) ;\
	cd $(TMP)/$(BINUTILS) ;\
	$(HOME)/src/$(BINUTILS)/configure $(BINUTILS_CFG)
