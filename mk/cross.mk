HW ?= pc

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk

XPATH = PATH=$(CROSS)/bin:$(PATH)
CFG   = configure --prefix=$(CROSS)

.PHONY: cross
cross: $(CROSS)/.gitignore $(ROOT)/.gitignore binutils
$(CROSS)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@
$(ROOT)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@

TLD = $(CROSS)/bin/$(TARGET)-ld
TCC = $(CROSS)/bin/$(TARGET)-gcc

.PHONY: binutils

BINUTILS_CFG += --disable-nls --target=$(TARGET)
BINUTILS_CFG += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
BINUTILS_CFG += --enable-lto --disable-multilib

binutils: $(TLD)
$(TLD): $(HOME)/src/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) ; mkdir $(TMP)/$(BINUTILS) ;\
	cd $(TMP)/$(BINUTILS) ;\
	$(XPATH) $(HOME)/src/$(BINUTILS)/$(CFG) $(BINUTILS_CFG) &&\
	$(MAKE) -j$(CORES) && $(MAKE) install-strip
