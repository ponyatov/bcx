CFG_LINUX = ARCH=$(ARCH) INSTALL_HDR_PATH=$(ROOT) INSTALL_MOD_PATH=$(ROOT)

.PHONY: linux
linux: $(TMP)/$(LINUX)/README
	cd $(TMP)/$(LINUX) ; rm .config ;\
	$(MAKE) $(CFG_LINUX) allnoconfig ;\
	echo 'CONFIG_LOCALVERSION="-$(APP)@$(HW)"' >> .config ;\
	echo 'CONFIG_DEFAULT_HOSTNAME="$(APP)@$(HW)"' >> .config ;\
	cat $(CWD)/all/all.linux      >> .config ;\
	cat $(CWD)/hw/$(HW).linux     >> .config ;\
	cat $(CWD)/cpu/$(CPU).linux   >> .config ;\
	cat $(CWD)/arch/$(ARCH).linux >> .config ;\
	cat $(CWD)/app/$(APP).linux   >> .config ;\
	$(MAKE) $(CFG_LINUX) menuconfig
