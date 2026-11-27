.PHONY: ai tmp/$(APP).ai.md
ai: tmp/$(APP).ai.md
tmp/$(APP).ai.md:
# find doc -type f -regex .+.md -exec cat {} > $@ \;
# cat README.md >> $@
# cat doc/bcx/debug.md >> $@
	python3 src/ai.py $@ \
		README.md \
		vscode/package.json vscode/extension.js \
		lib/debug/inc/debug.hpp lib/debug/src/debug.cpp

.PHONY: book tmp/$(APP).book.md
book: tmp/$(APP).book.md
tmp/$(APP).book.md:
	cat doc/book/*.md doc/book/book.ai.md > $@
