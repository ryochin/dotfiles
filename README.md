Dotfiles
========

[![CC0](http://img.shields.io/badge/license-CC0-blue.svg?style=flat)](LICENSE)

> My dotfiles.

Fish
----

### fisher + plugins

```sh
curl -L https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher install jethrokuan/z
fisher install 0rax/fish-bd

fish_update_completions
```

### Tide (prompt)

```sh
fisher install IlanCosman/tide@v6
```

```sh
tide configure --auto \
  --style=Rainbow \
  --prompt_colors='True color' \
  --show_time='24-hour format' \
  --rainbow_prompt_separators=Angled \
  --powerline_prompt_heads=Sharp \
  --powerline_prompt_tails=Flat \
  --powerline_prompt_style='Two lines, character and frame' \
  --prompt_connection=Dotted \
  --powerline_right_prompt_frame=No \
  --prompt_connection_andor_frame_color=Light \
  --prompt_spacing=Sparse \
  --icons='Many icons' \
  --transient=Yes
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

Nano
----

```sh
find /usr/share/nano -name '*.nanorc' | awk '{print "include \"" $1 "\""}' >> ~/.nanorc

# homebrew
find /opt/homebrew/share/nano/ -name '*.nanorc' | awk '{print "include \"" $1 "\""}' >> ~/.nanorc
```

git
---

```sh
chmod 755 /usr/share/doc/git/contrib/diff-highlight/diff-highlight
ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/
```

License
-------

CC0 1.0 Universal, Public Domain

