BASE = `pwd`
LINK = ln -sf
HARD_LINK = ln -f
COPY = cp -p

install: install-configs install-files install-git-templates  ## Install all files

install-configs:  ## Install config files
	test -e ~/.config || mkdir -p ~/.config
	$(LINK) $(BASE)/.config/fish ~/.config/
	$(LINK) $(BASE)/.config/htop ~/.config/
	$(LINK) $(BASE)/.config/bat ~/.config/
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
	$(LINK) $(BASE)/.vuerc ~
	$(LINK) $(BASE)/.tidyrc ~
	$(LINK) $(BASE)/.multitailrc ~
	$(LINK) $(BASE)/.gemrc ~

	# should be plain file
	$(HARD_LINK) $(BASE)/.dataprinter ~

install-git-templates:  ## Install Git template files
	test -e ~/.git-templates/hooks || mkdir -p ~/.git-templates/hooks
	$(COPY) $(BASE)/.git-templates/hooks/* ~/.git-templates/hooks/

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-32s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
