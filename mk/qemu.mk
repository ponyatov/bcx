.PHONY: qemu
qemu: $(KERNEL) $(INITRD)
	$(QEMU) $(QEMU_CFG) -kernel $(KERNEL) -initrd $(INITRD)
