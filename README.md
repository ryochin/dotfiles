Dotfiles
========

[![CC0](http://img.shields.io/badge/license-CC0-blue.svg?style=flat)](LICENSE)

> My dotfiles.

Fish
----

### fisher + plugins

```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add jethrokuan/z
fisher add 0rax/fish-bd

fish_update_completions
```

### fzf

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --64 --no-bash --no-zsh
fisher add fzf
```

### done

```sh
fisher add franciscolourenco/done
set -U __done_min_cmd_duration 60000
```

License
-------

CC0 1.0 Universal, Public Domain
