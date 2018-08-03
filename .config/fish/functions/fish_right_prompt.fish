function fish_right_prompt
  printf '%s %s%s' (__fish_git_prompt) "$__fish_color_blue" (env LANG=en_US date +'%Y.%m.%d %a %H:%M:%S')
end
