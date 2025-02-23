NAME = $(shell basename $(CURDIR))
TDIR = $(HOME)/.config/yazi/plugins/$(NAME)

install::
	mkdir -p $(TDIR)
	rm -f $(TDIR)/main.lua
	cp main.lua $(TDIR)/
