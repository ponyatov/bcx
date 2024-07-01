LIBC_CFG = CROSS_COMPILE=$(TARGET)- ARCH=$(ARCH) PREFIX=$(ROOT)

.PHONY: libc
libc: $(TMP)/$(LIBC)/README
	cd $(TMP)/$(LIBC) ; rm .config ;\
	$(XPATH) $(MAKE) $(LIBC_CFG) allnoconfig ;\
	echo 'KERNEL_HEADERS="$(ROOT)/usr/include"' >> .config ;\
	cat $(CWD)/all/all.libc      >> .config ;\
	cat $(CWD)/cpu/$(CPU).libc   >> .config ;\
	cat $(CWD)/arch/$(ARCH).libc >> .config ;\
	cat $(CWD)/app/$(APP).libc   >> .config ;\
	$(XPATH) $(MAKE) $(LIBC_CFG) menuconfig &&\
	$(XPATH) $(MAKE) $(LIBC_CFG) -j$(CORES) &&\
	$(XPATH) $(MAKE) $(LIBC_CFG) install

# echo 'CROSS_COMPILER_PREFIX="$(TARGET)-"' >> .config ;\
