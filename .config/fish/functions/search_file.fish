function search_file --description 'search files by name'
  switch (count $argv)
  case 1
    set dir '.'
  case 2
    set dir $argv[2]
  case '*'
    echo "usage: $_ <pattern> <dir>"
    return
  end

  set -l pattern $argv[1]

  find "$dir" -type f | perl -lne "print if /$pattern/ && ! /\.(svn|cvs|git|DS_Store)/" 2> /dev/null
end
