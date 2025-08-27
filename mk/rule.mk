$(CROSS)/src/%/README: $(DISTR)/%.tar.xz
	cd $(CROSS)/src ; xzcat $< | tar x && touch $@
$(CROSS)/src/%/README: $(DISTR)/%.tar.gz
	cd $(CROSS)/src ;  zcat $< | tar x && touch $@

bin/$(BINFILE): $(C) $(H) $(CP) $(HP) $(MK) $(CM)
	cmake --fresh --preset linux
	cmake --build --preset linux -j
