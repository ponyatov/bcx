HW ?= pc
# HW ?= qemu386
# HW ?= a7n8x
# HW ?= iskra
# HW ?= l496disco
# HW ?= f429disco

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk

ELF = bin/$(BINFILE).elf
DFU = bin/$(BINFILE).dfu

.PHONY: elf
elf: $(ELF)
	$(QEMU) $(QEMU_CFG) -gdb tcp::3333 -S -kernel $<

.PHONY: dfu
dfu: $(DFU)
$(DFU): $(ELF)
	~/elf2dfuse/bin/elf2dfuse $< $@

XPATH = PATH=$(CROSS)/$(TARGET)/bin:$(PATH)
CFG   = configure --prefix=$(CROSS)/$(TARGET)

.PHONY: cross
cross: $(CROSS)/.gitignore $(ROOT)/.gitignore binutils gcc0
$(CROSS)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@
$(ROOT)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@

TLD = $(CROSS)/$(TARGET)/bin/$(TARGET)-ld
TCC = $(CROSS)/$(TARGET)/bin/$(TARGET)-gcc

.PHONY: binutils

BINUTILS_CFG += --disable-nls --target=$(TARGET)
BINUTILS_CFG += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
BINUTILS_CFG += --enable-lto --disable-multilib

binutils: $(TLD)
$(TLD): $(CROSS)/src/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) ; mkdir $(TMP)/$(BINUTILS) ; cd $(TMP)/$(BINUTILS) ;\
	$(XPATH) $(dir $<)/$(CFG) $(BINUTILS_CFG) &&\
	$(MAKE) -j$(CORES) && $(MAKE) install-strip

.PHONY: gcc0

GCC0_CFG += $(BINUTILS_CFG) --enable-languages="c"
GCC0_CFG += --without-headers --with-newlib

gcc0: $(TCC)
$(TCC): $(CROSS)/src/$(GCC)/README
	rm -rf $(TMP)/$(GCC) ; mkdir $(TMP)/$(GCC) ; cd $(TMP)/$(GCC) ;\
	$(XPATH) $(dir $<)/$(CFG) $(GCC0_CFG)
	cd $(TMP)/$(GCC) ; $(XPATH) $(MAKE) -j$(CORES) all-gcc
	cd $(TMP)/$(GCC) ; $(XPATH) $(MAKE) install-gcc
# 	cd $(TMP)/$(GCC) ; $(XPATH) $(MAKE) all-target-libgcc
# 	cd $(TMP)/$(GCC) ; $(XPATH) $(MAKE) install-target-libgcc

.PHONY: linux
linux: $(CROSS)/src/$(LINUX)/README
	rm -f $(dir $<).config
	cd $(dir $<) ; $(XPATH) $(MAKE) \
		ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- allnoconfig
	cat os/linux/all.kernel                    >> $(dir $<).config
	cat   hw/$(HW)/$(HW).kernel                >> $(dir $<).config
	cat  cpu/$(CPU)/$(CPU).kernel              >> $(dir $<).config
	cat arch/$(ARCH)/$(ARCH).kernel            >> $(dir $<).config
	cat   os/linux/$(APP).kernel               >> $(dir $<).config
	echo 'CONFIG_LOCALVERSION="-$(APP)_$(HW)"' >> $(dir $<).config
	echo 'CONFIG_DEFAULT_HOSTNAME="$(APP)"'    >> $(dir $<).config
	cd $(dir $<) ; $(XPATH) $(MAKE) \
		ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- menuconfig
