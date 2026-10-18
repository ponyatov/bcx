GZ += tmp/gigacode-vscode-linux-$(GIGACODE_VER).vsix
tmp/gigacode-vscode-linux-$(GIGACODE_VER).vsix:
	$(CURL) $@ https://gigacode.ru/plugins/gigacode-vscode-linux-$(GIGACODE_VER).vsix

.PHONY: gigacode
gigacode:
	curl -vv -L -o tmp/gigacode-vscode-linux-26.10.76.vsix \
		https://gigacode.ru/plugins/gigacode-vscode-linux-26.10.76.vsix \
		2>> tmp/gigacode-vscode-linux.$(shell date +%d%m%y).log
