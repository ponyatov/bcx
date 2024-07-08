WRKDIRS = bin cross fw root tmp
.PHONY: distclean
distclean:
	rm -rf $(WRKDIRS) ; git checkout $(WRKDIRS)
