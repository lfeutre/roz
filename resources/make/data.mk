DB=$(shell cat resources/config/company-name)

mnesia-shell: compile-no-deps
	clear
	@ERL_LIBS=$(shell lfetool info erllibs) \
	PATH=$(SCRIPT_PATH) \
	lfe -pa $(TEST_OUT_DIR) -mnesia dir '"$(DB)"'
