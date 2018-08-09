# set -x LANG ja_JP.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR ee
set -x PAGER lv

export LD_LIBRARY_PATH=/usr/local/lib
export LIBRARY_PATH=/usr/local/lib

# surpress perl warnings
export PERL_BADLANG=0
export PERLDOC_PAGER={$PAGER}

# path
set -x fish_user_paths $HOME/bin $fish_user_paths

# *env
which rbenv > /dev/null 2>&1; and rbenv init - | source
which pyenv > /dev/null 2>&1; and pyenv init - | source
which plenv > /dev/null 2>&1; and plenv init - | source

# mysql
if test -e /usr/local/mysql/bin
  set -x fish_user_paths /usr/local/mysql/bin $fish_user_paths
end

# squid
if test -e /usr/local/squid222
  set -x fish_user_paths /usr/local/squid/bin     $fish_user_paths
  set -x fish_user_paths /usr/local/squid/sbin    $fish_user_paths
  set -x fish_user_paths /usr/local/squid/libexec $fish_user_paths
end

# go
if test -e $HOME/go
  set -x GOPATH $HOME/go
  set -x GOROOT $HOME/go
  test -e $GOROOT/bin; and set -x fish_user_paths $GOROOT/bin $fish_user_paths
  test -e $GOPATH/bin; and set -x fish_user_paths $GOPATH/bin $fish_user_paths
end

# app cli
if [ (uname) = 'Darwin' ]
  if [ -e '/Applications/CotEditor.app/Contents/SharedSupport/bin' ]
    set -x fish_user_paths '/Applications/CotEditor.app/Contents/SharedSupport/bin' $fish_user_paths
  end
  if [ -e '/Applications/Sublime Text.app/Contents/SharedSupport/bin' ]
    set -x fish_user_paths '/Applications/Sublime Text.app/Contents/SharedSupport/bin' $fish_user_paths
  end
  if [ -e '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' ]
    set -x fish_user_paths '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' $fish_user_paths
  end
end
