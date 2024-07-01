$(TMP)/%/README: $(GZ)/%.tar.xz
	cd $(TMP) ; xzcat $< | tar x && touch $@
