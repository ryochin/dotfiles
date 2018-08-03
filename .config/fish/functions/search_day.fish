function search_day --description 'search files by day'
  switch (count $argv)
  case 1
    set dir '.'
  case 2
    set dir $argv[2]
  case '*'
    echo "usage: $_ <day> <dir>"
    return
  end

  set -l day $argv[1]

  find "$dir" -mtime -$day \! -type d | perl -lne "print if ! /\.(svn|cvs|git|DS_Store)/" | xargs ls -ltr
end
