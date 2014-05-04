DB=$(shell cat resources/config/company-name)
#NODE=-sname roz
NODE=

mnesia-shell-compile: compile-no-deps mnesia-shell

mnesia-shell:
	ERL_LIBS=$(shell lfetool info erllibs) \
	PATH=$(SCRIPT_PATH) \
	lfe -mnesia dir '"$(DB)"'

.PHONY: mnesia-shell-compile mnesia-shell
