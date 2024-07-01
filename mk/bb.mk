BB_CFG = CROSS_COMPILE=$(TARGET)- PREFIX=$(ROOT)

.PHONY: bb
bb: $(TMP)/$(BB)/README
	cd $(TMP)/$(BB) ; rm .config ;\
	cat $(CWD)/all/all.bb      >> .config ;\
	$(XPATH) $(MAKE) $(BB_CFG) menuconfig &&\
	$(XPATH) $(MAKE) $(BB_CFG) -j$(CORES) &&\
	$(XPATH) $(MAKE) $(BB_CFG) install CONFIG_PREFIX=$(ROOT)

# $(XPATH) $(MAKE) $(BB_CFG) allnoconfig ;\
