function fish_greeting
  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_color_red
    set -g __fish_color_red (set_color -o red)
  end

  if not set -q __fish_color_blue
    set -g __fish_color_blue (set_color -o blue)
  end

  printf "Welcome to fish on %s%s%s %s(%s)%s\n" "$__fish_color_red" (hostname) "$__fish_prompt_normal" "$__fish_color_blue" (uname -rs) "$__fish_prompt_normal"
  echo ''
  echo " (*'-') < Hi!"
  echo ''
end
