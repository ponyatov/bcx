CFG_LINUX = ARCH=$(ARCH) INSTALL_HDR_PATH=$(ROOT) INSTALL_MOD_PATH=$(ROOT)

.PHONY: linux
linux: $(TMP)/$(LINUX)/README
	cd $(TMP)/$(LINUX) ; rm .config ;\
	$(MAKE) $(CFG_LINUX) allnoconfig ;\
	echo "CONFIG_CROSS_COMPILE=\"$(TARGET)-\""    >> .config ;\
	echo 'CONFIG_LOCALVERSION="-$(APP)@$(HW)"'    >> .config ;\
	echo 'CONFIG_DEFAULT_HOSTNAME="$(APP)@$(HW)"' >> .config ;\
	cat $(CWD)/all/all.linux      >> .config ;\
	cat $(CWD)/hw/$(HW).linux     >> .config ;\
	cat $(CWD)/cpu/$(CPU).linux   >> .config ;\
	cat $(CWD)/arch/$(ARCH).linux >> .config ;\
	cat $(CWD)/app/$(APP).linux   >> .config ;\
	$(MAKE) $(CFG_LINUX) menuconfig &&\
	$(MAKE) $(CFG_LINUX) -j$(CORES) &&\
	$(MAKE) $(CFG_LINUX) -j$(CORES) modules_install headers_install

KERNEL = $(FW)/$(APP)_$(HW).kernel
$(KERNEL): $(TMP)/$(LINUX)/arch/$(ARCH)/boot/bzImage
	cp $< $@
