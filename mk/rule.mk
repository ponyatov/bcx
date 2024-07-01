$(TMP)/%/README: $(GZ)/%.tar.xz
	cd $(TMP) ; xzcat $< | tar x && touch $@
$(TMP)/%/README: $(GZ)/%.tar.gz
	cd $(TMP) ;  zcat $< | tar x && touch $@
