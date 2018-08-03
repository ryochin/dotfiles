function nmore --description 'more with column numbers'
  cat -n $argv[1] | sed -e 's/^ //' | eval $PAGER
end
