# var
MODULE  = $(notdir $(CURDIR))
NOW     = $(shell date +%d%m%y)
REL     = $(shell git rev-parse --short=4 HEAD)
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
CORES  ?= $(shell grep processor /proc/cpuinfo | wc -l)

# cross
APP ?= $(MODULE)
HW  ?= qemu386
include   hw/$(HW).mk
include  cpu/$(CPU).mk
include arch/$(ARCH).mk
include  app/$(APP).mk

# version
include mk/version.mk

# dirs
CWD   = $(CURDIR)
BIN   = $(CWD)/bin
DOC   = $(CWD)/doc
INC   = $(CWD)/inc
SRC   = $(CWD)/src
TMP   = $(CWD)/tmp
BUILD = $(TMP)/$(MODULE)
include mk/dirs.mk

# tool
CURL = curl -L -o
CF   = clang-format -style=file -i

TCXX  = $(XPATH) $(TARGET)-g++
TSIZE = $(XPATH) $(TARGET)-size

# src
C += $(wildcard src/$(MODULE).c*)
H += $(wildcard inc/*.h*)
F += lib/$(MODULE).ini $(wildcard lib/*.f)
CP = tmp/$(MODULE).parser.cpp tmp/$(MODULE).lexer.cpp
HP = tmp/$(MODULE).parser.hpp
CM = CMakeLists.txt $(wildcard cmake/*.cmake)
MK = Makefile $(wildcard mk/*.mk)
S  = $(C) $(H) $(F) $(CM) $(MK)

# cfg
CFLAGS += -I$(INC) -I$(TMP)
TCFLAGS += $(CFLAGS)

LIBS_CFG = --enable-static --enable-shared

CFG   = configure --prefix=$(CROSS) --disable-nls
TFG   = configure --prefix=$(ROOT)  --disable-nls --host=$(TARGET) $(LIBS_CFG)
XPATH = PATH=$(CROSS)/bin:$(PATH)

# package
include mk/package.mk

# all
.PHONY: all
all: bin/$(MODULE) lib/$(MODULE).ini
	$^

# format
.PHONY: format
format: tmp/format_c
tmp/format_c: $(C) $(H)
	$(CF) $? && touch $@

# rule
bin/$(MODULE): $(C) $(H) $(CP) $(HP)
	$(CXX) $(CFLAGS) -o $@ $(C) $(CP) $(L)
tmp/$(MODULE).lexer.cpp: src/$(MODULE).lex
	flex -o $@ $<
tmp/$(MODULE).parser.cpp: src/$(MODULE).yacc
	bison -o $@ $<

cmake: bin/$(MODULE) $(F)
	$^
$(BUILD)/CMakeCache.txt: $(S)
	cmake -DAPP=$(MODULE) -DCMAKE_TOOLCHAIN_FILE=Linux -S$(CWD) -B$(BUILD)
# bin/$(MODULE): $(BUILD)/CMakeCache.txt $(CP) $(HP)
# 	cd $(BUILD) ; make -j$(CORES)
tmp/$(MODULE).exe: $(BUILD)/CMakeCache.txt $(CP) $(HP)
	cmake -DAPP=$(MODULE) -DCMAKE_TOOLCHAIN_FILE=Windows -S$(CWD) -B$(BUILD)

include mk/rule.mk

# doc
.PHONY: doxy
doxy: .doxygen
	rm -rf docs ; doxygen $< 1>/dev/null

.PHONY: doc
doc:


# install
.PHONY: install update gz ref
install: doc gz ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
include mk/gz.mk
gz: $(GZX)
ref:

# cross
include mk/cclibs.mk
include mk/gcc.mk
include mk/linux.mk
include mk/libc.mk
include mk/bb.mk
include mk/boot.mk
include mk/qemu.mk
include mk/sw.mk
include mk/clean.mk

# merge
MERGE += Makefile README.md .gitignore .clang-format .doxygen
MERGE += bin doc lib inc src tmp ref $(S)
MERGE += all hw cpu arch app
MERGE += apt.txt

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)
#	$(MAKE) doxy ; git add -f docs

.PHONY: shadow
shadow:
	git push -v
	git checkout $@
	git pull -v

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow
