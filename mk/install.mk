.PHONY: install update ref gz
install: ref gz
	sudo dpkg --add-architecture i386
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.Debian`
ref: $(RF)
gz:  $(GZ)
