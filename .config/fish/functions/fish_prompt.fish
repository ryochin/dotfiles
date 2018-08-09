function fish_prompt --description 'Write out the prompt'
  if [ $status -eq 0 ]
    set status_face (set_color green)"(*'-')"
  else
    set status_face (set_color red)"(*>_<)"
  end

	# Save the return status of the previous command
  set stat $status

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # colors
  set -g __fish_color_prompt_hostname (set_color -u -o cc7)
  set -g __fish_color_prompt_current_path (set_color -o blue)

  if [ $USER = 'root' ]
    set -g __fish_color_prompt_username (set_color red)
  else
    set -g __fish_color_prompt_username (set_color normal)
  end

  printf "%s%s%s %s%s ' %s%s \f\r %s%s < " \
    "$__fish_color_prompt_hostname" (hostname -s) "$__fish_prompt_normal" \
    "$__fish_color_prompt_username" $USER \
    "$__fish_color_prompt_current_path" "$PWD" \
    $status_face \
    "$__fish_prompt_normal"
end
