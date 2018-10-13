BASE = `pwd`
LINK = ln -sf

install: install-configs install-files  ## Install all files

install-configs:  ## Install config files
	test -e ~/.config || mkdir -p ~/.config
	$(LINK) $(BASE)/.config/fish ~/.config/
	$(LINK) $(BASE)/.config/htop ~/.config/

install-files:  ## Install dot files
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

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-32s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
