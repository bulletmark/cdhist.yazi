name = $(shell basename $(CURDIR))
TDIR = $(HOME)/.config/$(name)

install::
	mkdir -p $(TDIR)
	cp main.lua $(TDIR)/
