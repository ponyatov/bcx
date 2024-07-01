LIBC_CFG = CROSS=$(TARGET)- ARCH=$(ARCH) \
			PREFIX=$(ROOT)/libc 

.PHONY: libc
libc: $(TMP)/$(LIBC)/README
	cd $(TMP)/$(LIBC) ; rm .config ;\
	$(XPATH) $(MAKE) $(LIBC_CFG) allnoconfig ;\
	echo 'KERNEL_HEADERS="$(ROOT)/include"' >> .config ;\
	echo 'CROSS_COMPILER_PREFIX="$(TARGET)-"' >> .config ;\
	cat $(CWD)/all/all.libc      >> .config ;\
	cat $(CWD)/cpu/$(CPU).libc   >> .config ;\
	cat $(CWD)/arch/$(ARCH).libc >> .config ;\
	cat $(CWD)/app/$(APP).libc   >> .config ;\
	$(XPATH) $(MAKE) $(LIBC_CFG) menuconfig &&\
	$(XPATH) $(MAKE) -j$(CORES)
