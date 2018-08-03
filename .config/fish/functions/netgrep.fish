function netgrep --description 'netstat grep'
  set -l ret 1

  for i in $argv
    if netstat -na | grep "$i" | grep -v stream
      set ret 0
    end
  end

  return $ret
end
