.PHONY: ai tmp/$(APP).ai.md
ai: tmp/$(APP).ai.md
tmp/$(APP).ai.md: doc
	cat doc/ai.md README.md doc/bib.md doc/$(APP)/bib.md \
		  doc/$(APP)/*.md \
	> $@ ; touch $@
