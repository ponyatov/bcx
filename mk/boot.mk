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
