function renicegrep --description 'renice down by prosess name'
  if [ (count $argv) -ne 1 ]
    echo "usage: $_ <process name>"
    return
  end

  set -l list (ps auxw | grep -i $argv[1] | grep -v grep | awk '{print $2}')

  if [ (count $list) -gt 0 ]
    for pid in $list
      renice +20 $pid
      printf "pid %d\n" $pid
    end
  else
    printf "no such process name: %s\n" $argv[1]
    return
  end
end
