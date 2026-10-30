GIGACODE_URL = https://gigacode.ru/plugins
GIGACODE_VSIX = gigacode-vscode-linux-$(GIGACODE_VER).vsix

# GZ += tmp/$(GIGACODE_VSIX)
.PHONY: gigacode tmp/$(GIGACODE_VSIX)
gigacode: tmp/$(GIGACODE_VSIX)
tmp/$(GIGACODE_VSIX):
	rm tmp/gigacode*
	-curl -vv -C - -L $(GIGACODE_URL)/$(GIGACODE_VSIX) \
		-o $@ 2>> $@.$(TODAY).log
	curl -vv -s https://api.ipify.org \
		-o $@.$(TODAY).ipify 2>> $@.$(TODAY).log
