function delds --description 'delete .DS_store files'
  find . -type f -name '.DS_Store' -print0 | xargs -0 rm -f
end
