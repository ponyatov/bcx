GZ += tmp/gigacode-vscode-linux-$(GIGACODE_VER).vsix
tmp/gigacode-vscode-linux-$(GIGACODE_VER).vsix:
	$(CURL) $@ https://gigacode.ru/plugins/gigacode-vscode-linux-$(GIGACODE_VER).vsix
