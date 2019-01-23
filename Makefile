BASE = `pwd`
LINK = ln -sf
HARD_LINK = ln -f

install: install-configs install-files  ## Install all files

install-configs:  ## Install config files
	test -e ~/.config || mkdir -p ~/.config
	$(LINK) $(BASE)/.config/fish ~/.config/
	$(LINK) $(BASE)/.config/htop ~/.config/
	mkdir -p ~/.config/glances
	$(LINK) $(BASE)/.config/glances/glances.conf ~/.config/glances/

install-files:  ## Install dot files
	$(LINK) $(BASE)/.colordiffrc ~
	$(LINK) $(BASE)/.editorconfig ~
	$(LINK) $(BASE)/.fd2rc ~
	$(LINK) $(BASE)/.gitconfig ~
	$(LINK) $(BASE)/.iex.exs ~
	$(LINK) $(BASE)/.init.ee ~
	$(LINK) $(BASE)/.mytoprc ~
	$(LINK) $(BASE)/.nanorc ~
	$(LINK) $(BASE)/.proverc ~
	$(LINK) $(BASE)/.pryrc ~
	$(LINK) $(BASE)/.sbtrc ~
	$(LINK) $(BASE)/.tigrc ~
	$(LINK) $(BASE)/.toprc ~
	$(LINK) $(BASE)/.tmux.conf ~
	$(LINK) $(BASE)/.replyrc ~
	$(LINK) $(BASE)/.boto ~
	$(LINK) $(BASE)/.agignore ~

	# should be plain file
	$(HARD_LINK) $(BASE)/.dataprinter ~

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-32s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
