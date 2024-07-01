LINUX_CFG = ARCH=$(ARCH) INSTALL_HDR_PATH=$(ROOT)/usr INSTALL_MOD_PATH=$(ROOT)

.PHONY: linux
linux: $(TMP)/$(LINUX)/README
	cd $(TMP)/$(LINUX) ; rm .config ;\
	$(XPATH) $(MAKE) $(LINUX_CFG) allnoconfig ;\
	echo "CONFIG_CROSS_COMPILE=\"$(TARGET)-\""    >> .config ;\
	echo 'CONFIG_LOCALVERSION="-$(APP)_$(HW)"'    >> .config ;\
	echo 'CONFIG_DEFAULT_HOSTNAME="$(APP)_$(HW)"' >> .config ;\
	cat $(CWD)/all/all.linux      >> .config ;\
	cat $(CWD)/hw/$(HW).linux     >> .config ;\
	cat $(CWD)/cpu/$(CPU).linux   >> .config ;\
	cat $(CWD)/arch/$(ARCH).linux >> .config ;\
	cat $(CWD)/app/$(APP).linux   >> .config ;\
	$(XPATH) $(MAKE) $(LINUX_CFG) menuconfig &&\
	$(XPATH) $(MAKE) $(LINUX_CFG) -j$(CORES) &&\
	$(XPATH) $(MAKE) $(LINUX_CFG) -j$(CORES) modules_install headers_install

KERNEL = $(FW)/$(APP)_$(HW).kernel
INITRD = $(FW)/$(APP)_$(HW).initrd

.PHONY: fw
fw: $(KERNEL)
$(KERNEL): $(TMP)/$(LINUX)/arch/$(ARCH)/boot/bzImage
	cp $< $@
