GIGACODE_URL = https://gigacode.ru/plugins
GIGACODE_VSIX = gigacode-vscode-linux-$(GIGACODE_VER).vsix

GZ += tmp/$(GIGACODE_VSIX)
.PHONY: gigacode tmp/$(GIGACODE_VSIX)
gigacode: tmp/$(GIGACODE_VSIX)
tmp/$(GIGACODE_VSIX):
	rm -f $@*
	curl -vv -L -o $@ \
		$(GIGACODE_URL)/$(GIGACODE_VSIX) \
		2> $@.$(shell date +%d%m%y).log
