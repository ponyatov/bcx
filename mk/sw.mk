.PHONY: hello
hello: $(ROOT)/opt/hello

$(ROOT)/opt/%: src/%.cpp $(H) $(MK)
	$(TCXX) $(TCFLAGS) -o $@ $<
	file $@ ; $(TSIZE) $@
