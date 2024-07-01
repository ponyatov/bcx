BB_CFG = CROSS_COMPILE=$(TARGET)- PREFIX=$(ROOT)/bb

# CROSS_COMPILE=$(TARGET)- ARCH=$(ARCH) PREFIX=$(ROOT)

# echo 'KERNEL_HEADERS="$(ROOT)/usr/include"' >> .config ;\
# cat $(CWD)/cpu/$(CPU).libc   >> .config ;\
# cat $(CWD)/arch/$(ARCH).libc >> .config ;\
# $(XPATH) $(MAKE) $(LIBC_CFG) -j$(CORES) &&\
# $(XPATH) $(MAKE) $(LIBC_CFG) install

# echo 'CROSS_COMPILER_PREFIX="$(TARGET)-"' >> .config ;\

.PHONY: bb
bb: $(TMP)/$(BB)/README
	cd $(TMP)/$(BB) ; rm .config ;\
	cat $(CWD)/all/all.bb      >> .config ;\
	$(XPATH) $(MAKE) $(BB_CFG) menuconfig


# $(XPATH) $(MAKE) $(BB_CFG) allnoconfig ;\
# cat $(CWD)/app/$(APP).bb   >> .config ;\
