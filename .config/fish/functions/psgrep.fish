function psgrep --description 'grep by prosess name'
  set -l ret 1

  for i in $argv
    if ps aux | grep -v grep | grep "$i"
      set ret 0
    end
  end

  return $ret
end
