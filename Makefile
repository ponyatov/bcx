# var
MODULE  = $(notdir $(CURDIR))

# dirs
CWD = $(CURDIR)
INC = $(CWD)/inc
SRC = $(CWD)/src
TMP = $(CWD)/tmp

# tool
CURL   = curl -L -o
CF     = clang-format -style=file -i

# src
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
F += lib/$(MODULE).ini $(wildcard lib/*.f)
S  = $(C) $(H) $(F)

# cfg
CFLAGS += -I$(INC) -I$(TMP)

# all
.PHONY: all
all: bin/$(MODULE) lib/$(MODULE).ini
	$^

# format
.PHONY: format
format: tmp/format_cpp
tmp/format_cpp: $(C) $(H)
	$(CF) $? && touch $@

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# doc
.PHONY: doc
doc:

.PHONY: doxy
doxy: .doxygen
	rm -rf docs ; doxygen $< 1>/dev/null

# install
.PHONY: install update gz ref
install: doc gz ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
gz:
ref:
