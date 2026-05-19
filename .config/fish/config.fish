# reset
set -U fish_user_paths ''

# files
source ~/.config/fish/env.fish
source ~/.config/fish/alias.fish

# status --is-interactive; and source (jump shell fish | psub)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
# set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
# set __fish_git_prompt_char_dirtystate '⚡'
# set __fish_git_prompt_char_stagedstate '→'
# set __fish_git_prompt_char_untrackedfiles '☡'    # hazard symbol
# set __fish_git_prompt_char_stashstate '↩'
# set __fish_git_prompt_char_upstream_ahead '+'
# set __fish_git_prompt_char_upstream_behind '-'

# auto cd
function cd
  builtin cd $argv
  d
end

# home

function sethome
  set -g MYHOME (pwd)
end

function gohome
  cd "$MYHOME"
end

set -Ux GPG_TTY (tty)

# gcs
set GCS_DIR /usr/local/google-cloud-sdk
if [ -f "$GCS_DIR/path.fish.inc" ]
  if type source > /dev/null
    source "$GCS_DIR/path.fish.inc"
  else
    . "$GCS_DIR/path.fish.inc"
  end
end

# asdf
if test -e /opt/asdf
  set -x ASDF_DATA_DIR /opt/asdf
end

# if test -e /opt/asdf/asdf.fish
#   source /opt/asdf/asdf.fish
# else if test -e /opt/homebrew/opt/asdf/asdf.fish
#   source /opt/homebrew/opt/asdf/asdf.fish
# else if test -e /opt/homebrew/opt/asdf/libexec/asdf.fish
#   source /opt/homebrew/opt/asdf/libexec/asdf.fish
# else if test -e /usr/local/opt/asdf/asdf.fish
#   source /usr/local/opt/asdf/asdf.fish
# else if test -e /opt/asdf/asdf.fish
#   source /opt/asdf/asdf.fish
# end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# llvm
if test -e /usr/local/opt/llvm/bin
  set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
end

# autojump
if test -e /usr/local/share/autojump/autojump.fish
  source /usr/local/share/autojump/autojump.fish
end

if test -e /opt/homebrew/share/autojump/autojump.fish
  source /opt/homebrew/share/autojump/autojump.fish
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/ryo/Desktop/monitorbox-status-screenshot-taker/aws/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/ryo/Desktop/monitorbox-status-screenshot-taker/aws/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/ryo/Desktop/monitorbox-status-screenshot-taker/aws/node_modules/tabtab/.completions/sls.fish ]; and . /Users/ryo/Desktop/monitorbox-status-screenshot-taker/aws/node_modules/tabtab/.completions/sls.fish
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryo/Desktop/google-cloud-sdk/path.fish.inc' ]; . '/Users/ryo/Desktop/google-cloud-sdk/path.fish.inc'; end

# pnpm
set -gx PNPM_HOME "/Users/ryo/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/ryo/.lmstudio/bin
# End of LM Studio CLI section


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/ryo/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

wtp shell-init fish | source
