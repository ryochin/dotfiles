function low --description 'low pritority run'
  switch (uname)
    case Linux
      alias low 'ionice -c2 -n7 nice -10'
    case '*'
      alias low 'nice -10'
  end
end
