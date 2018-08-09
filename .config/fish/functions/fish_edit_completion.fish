function fish_edit_completion --description 'edit completion'
  eval "$EDITOR $HOME/.config/fish/completions/$argv[1].fish"
end
