ISOLINUX += $(ROOT)/isolinux/isolinux.cfg
ISOLINUX += $(ROOT)/isolinux/isohdpfx.bin
ISOLINUX += $(ROOT)/isolinux/isohdppx.bin
ISOLINUX += $(ROOT)/isolinux/isolinux.bin
ISOLINUX += $(ROOT)/isolinux/ldlinux.c32
ISOLINUX += $(ROOT)/isolinux/libutil.c32
ISOLINUX += $(ROOT)/isolinux/menu.c32
ISOLINUX += $(ROOT)/isolinux/ls.c32

.PHONY: isolinux $(ROOT)/isolinux/isolinux.cfg
isolinux: $(ISOLINUX)

$(ROOT)/isolinux/isolinux.cfg:
	echo 'default    menu.c32'                              > $@
	echo 'timeout    0'                                    >> $@
	echo 'menu title $(APP)Linux'                          >> $@
	echo 'label      $(BINFILE)'                           >> $@
	echo 'menu       default'                              >> $@
	echo 'kernel     /boot/bzImage'                        >> $@
	echo 'append     root=LABEL=$(BINFILE) video=1440x900' >> $@

$(ROOT)/isolinux/%: /usr/lib/ISOLINUX/%
	cp $< $@
# $(ROOT)/isolinux/%: /usr/lib/syslinux/modules/efi64/%
# 	cp $< $@
$(ROOT)/isolinux/%: /usr/lib/syslinux/modules/bios/%
	cp $< $@

ISO = $(BIN)/$(BINFILE).iso
.PHONY: iso $(ISO)
iso: $(ISO)
$(ISO): $(ISOLINUX)
	xorriso -as mkisofs -isohybrid-mbr $(ROOT)/isolinux/isohdpfx.bin \
		-c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot \
		-boot-load-size 4 -boot-info-table -eltorito-alt-boot \
		-no-emul-boot -isohybrid-gpt-basdat \
			-V $(BINFILE) -o $@ $(ROOT)
	isohybrid $@
# -e boot/grub/efi.img

.PHONY: qemu
qemu: $(ISO)
	$(QEMU) $(QEMU_CFG) -vga virtio -boot d -cdrom $<
