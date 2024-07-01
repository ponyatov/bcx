.PHONY: qemu
qemu: $(KERNEL)
	$(QEMU) $(QEMU_CFG) -kernel $(KERNEL)
