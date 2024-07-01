LIBC_CFG = CROSS=$(TARGET)- ARCH=$(ARCH) PREFIX=$(ROOT)/libc

.PHONY: libc
libc: $(TMP)/$(LIBC)/README
	cd $(TMP)/$(LIBC) ; rm .config ;\
	$(XPATH) $(MAKE) $(LIBC_CFG) allnoconfig ;\
	cat $(CWD)/all/all.libc      >> .config ;\
	cat $(CWD)/cpu/$(CPU).libc   >> .config ;\
	cat $(CWD)/arch/$(ARCH).libc >> .config ;\
	cat $(CWD)/app/$(APP).libc   >> .config ;\
	$(XPATH) $(MAKE) $(LIBC_CFG) menuconfig
