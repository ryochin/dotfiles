function psgrep --description 'grep by prosess name'
  echo -n (set_color -o blue)

  switch (command uname)
    case Darwin
      echo "USER               PID  %CPU %MEM       VSZ    RSS   TT  STAT STARTED      TIME COMMAND"
    case \*
      echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"
  end

  printf "%s" (set_color normal)

  set -l ret 1

  for i in $argv
    if ps aux | grep -v grep | grep "$i"
      set ret 0
    end
  end

  return $ret
end
