# basics
set -x LANG en_US.UTF-8
set -x EDITOR ee
set -x PAGER lv

set -x LD_LIBRARY_PATH /usr/local/lib
set -x LIBRARY_PATH /usr/local/lib

# surpress perl warnings
export PERL_BADLANG=0
export PERLDOC_PAGER={$PAGER}

# path
if test -e $HOME/bin
  set -x fish_user_paths $HOME/bin $fish_user_paths
end

# *env
which rbenv > /dev/null 2>&1; and rbenv init - | source
# which pyenv > /dev/null 2>&1; and pyenv init - | source
which plenv > /dev/null 2>&1; and plenv init - | source
which scalaenv > /dev/null 2>&1; and scalaenv init - | source

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

# perl
if [ (uname) = 'Darwin' -a -e '/usr/local/opt/perl520/bin' ]
  set -x fish_user_paths /usr/local/opt/perl520/bin $fish_user_paths
end

# java
if [ (uname) = 'Darwin' ]
  set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
else if [ (uname) = 'Linux' ]
  set -x JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-0.b14.el7_2.x86_64
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
