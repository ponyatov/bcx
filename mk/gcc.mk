BINUTILS_CFG = 
GCC_CFG      = $(BINUTILS_CFG)

gcc: $(GZ)/$(GCC_GZ)

binutils: $(CROSS)/bin/ld
$(CROSS)/bin/ld: $(TMP)/$(BINUTILS)/README
# cd $(TMP)/$(BINUTILS); ./$(CFG) $(BINUTILS_CFG) \
# && $(MAKE) -j$(CORES) && $(MAKE) install
