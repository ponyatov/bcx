HW ?= pc

include   hw/$(HW)/$(HW).mk
include  cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include   os/$(OS)/$(OS).mk

.PHONY: cross
cross: $(CROSS)/.gitignore
$(CROSS)/.gitignore: bin/.gitignore
	mkdir -p $(dir $@) ; cp $< $@
