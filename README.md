Dotfiles
========

[![CC0](http://img.shields.io/badge/license-CC0-blue.svg?style=flat)](LICENSE)

> My dotfiles.

Fish
----

### fisher + plugins

```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher install jethrokuan/z
fisher install 0rax/fish-bd

fish_update_completions
```

### fzf

```sh
brew install fzf    # macOS
sudo apt install -y fzf    # on Ubuntu

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-zsh

fzf_key_bindings
```

### done

```sh
fisher install franciscolourenco/done
set -U __done_min_cmd_duration 60000
```

License
-------

CC0 1.0 Universal, Public Domain

