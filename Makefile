BASE = `pwd`
LINK = ln -sf

all:

install: install-configs install-files

install-configs:
	test -e ~/.config || mkdir -p ~/.config
	$(LINK) $(BASE)/.config/fish ~/.config/
	$(LINK) $(BASE)/.config/htop ~/.config/

install-files:
	$(LINK) $(BASE)/.colordiffrc ~
	$(LINK) $(BASE)/.editorconfig ~
	$(LINK) $(BASE)/.fd2rc ~
	$(LINK) $(BASE)/.gitconfig ~
	$(LINK) $(BASE)/.iex.exs ~
	$(LINK) $(BASE)/.init.ee ~
	$(LINK) $(BASE)/.mytoprc ~
	$(LINK) $(BASE)/.proverc ~
	$(LINK) $(BASE)/.pryrc ~
	$(LINK) $(BASE)/.sbtrc ~
	$(LINK) $(BASE)/.tigrc ~
	$(LINK) $(BASE)/.toprc ~
