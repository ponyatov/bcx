.PHONY: boot initrd
boot: initrd
initrd: $(INITRD)

ROOTREX = "./(.gitignore|boot|etc/inittab.sample)"

CPIO = $(FW)/$(APP)_$(HW).cpio

$(INITRD): $(CPIO)
	cat $< | gzip -9 > $@

.PHONY: $(CPIO)
$(CPIO):
	cd $(ROOT) &&\
	find . | egrep -v $(ROOTREX) | cpio -o -H newc > $@

# https://github.com/coreprocess/linux-unattended-installation/issues/2#issuecomment-385360423

ISO = $(FW)/$(APP)_$(HW).iso
.PHONY: iso $(ISO)
iso: $(ISO)

USER  = $(shell git config user.name )
EMAIL = $(shell git config user.email)

ISOLINUX_DIR    = $(FW)/iso/isolinux
SYSLINUX_FILES  = $(ISOLINUX_DIR)/isolinux.bin
SYSLINUX_FILES += $(ISOLINUX_DIR)/ldlinux.c32 $(ISOLINUX_DIR)/libcom32.c32
SYSLINUX_FILES += $(ISOLINUX_DIR)/ls.c32 $(ISOLINUX_DIR)/poweroff.c32 $(ISOLINUX_DIR)/reboot.c32

$(ISO): $(SYSLINUX_FILES)
	xorriso -as mkisofs -r -J -A $(APP)@$(HW) -P "$(USER) <$(EMAIL)>" \
		-eltorito-platform x86 -b isolinux/isolinux.bin \
		-c boot.cat -iso-level 3 \
		-no-emul-boot -partition_offset 16 -boot-load-size 4 \
		-boot-info-table -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
		-o $@ $(FW)/iso
	iso-info $@
	$(QEMU) $(QEMU_CFG) -boot d -cdrom $@
$(ISOLINUX_DIR)/%: /usr/lib/ISOLINUX/%
	cp $< $@
$(ISOLINUX_DIR)/%: /usr/lib/syslinux/modules/bios/%
	cp $< $@
