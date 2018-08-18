# reset
set -U fish_user_paths ''

# files
. ~/.config/fish/env.fish
. ~/.config/fish/alias.fish

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
  dir
end

# home

function sethome
	set -g MYHOME (pwd)
end

function gohome
	cd "$MYHOME"
end

# gcs
set GCS_DIR /usr/local/google-cloud-sdk
if [ -f "$GCS_DIR/path.fish.inc" ]
  if type source > /dev/null
    source "$GCS_DIR/path.fish.inc"
  else
    . "$GCS_DIR/path.fish.inc"
  end
end
