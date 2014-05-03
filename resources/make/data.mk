DB=$(shell cat resources/config/company-name)
#NODE=-sname roz
NODE=

mnesia-shell: compile-no-deps
	clear
	@ERL_LIBS=$(shell lfetool info erllibs) \
	PATH=$(SCRIPT_PATH) \
	lfe -pa $(TEST_OUT_DIR) $(NODE) -mnesia dir '"$(DB)"' -run mnesia start
