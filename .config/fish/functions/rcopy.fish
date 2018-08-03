function rcopy --description 'recursive local copy'
  if [ (count $argv) -ne 2 ]
    echo "usage: $_ <from> <to>"
    return
  end

  rsync -auxtq "$argv[1]" "$argv[2]"
end
