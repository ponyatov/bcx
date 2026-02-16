.PHONY: all run watch
all: bin/$(APP)
run: bin/$(APP) lib/$(APP).ini
	cgexec -g memory:$(APP) $^
watch: bin/$(APP)
	@$^ ; while [ $$? -eq 1 ]; do $^ ; done
