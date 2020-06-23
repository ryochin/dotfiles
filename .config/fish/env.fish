### Basic

set -x LANG en_US.UTF-8
set -x EDITOR vi
set -x PAGER "less -RF"

set PATH /usr/local/sbin /usr/libexec /usr/local/libexec $PATH

if test -e $HOME/bin
  set PATH $HOME/bin $PATH
end

### Library

set -x LD_LIBRARY_PATH /usr/local/lib
set -x LIBRARY_PATH /usr/local/lib

### Programming Languages

# Perl
set -x PERL_BADLANG 0
set -x PERLDOC_PAGER {$PAGER}

# Scala
if test -e $HOME/.conscript/bin
  set PATH $HOME/.conscript/bin $PATH
end

# Eglang
set -x ERL_AFLAGS "-kernel shell_history enabled"

# Elixir
if test -e ~/.mix/escripts
  set PATH ~/.mix/escripts $PATH
end

### Java

if [ (uname) = 'Darwin' ]
  set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
else if [ (uname) = 'Linux' ]
  set -x JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-0.b14.el7_2.x86_64
end

# Go
set -x GOPATH $HOME/go
export GOENV_ROOT="$HOME/.goenv"

if test -e $GOENV_ROOT/bin
  set PATH $GOENV_ROOT/bin $PATH
end

if test -e $GOPATH/bin
  set PATH $GOPATH/bin $PATH
end

# deno
if test -e ~/.deno/bin
  set PATH ~/.deno/bin $PATH
end

### *env

which plenv >/dev/null 2>&1; and plenv init - | source
which rbenv >/dev/null 2>&1; and rbenv init - | source
which pyenv >/dev/null 2>&1; and pyenv init - | source
which nodenv >/dev/null 2>&1; and nodenv init - | source
which scalaenv >/dev/null 2>&1; and scalaenv init - | source
which sbtenv >/dev/null 2>&1; and sbtenv init - | source
which nodenv >/dev/null 2>&1; and nodenv init - | source
which erlenv >/dev/null 2>&1; and erlenv init - | source
which goenv >/dev/null 2>&1; and goenv init - | source
# which exenv       > /dev/null 2>&1; and exenv       init - | source

if test -e /opt/rbenv/bin
  set PATH /opt/rbenv/bin $PATH
end
if test -e ~/.erlenv/shims
  set PATH ~/.erlenv/shims $PATH
end
if test -e ~/.exenv/shims
  set PATH ~/.exenv/shims $PATH
end

### CLI Options

set -x HOMEBREW_AUTO_UPDATE_SECS 21600
set -x BAT_THEME "Monokai Extended Bright"

### MySQL

set -x MYSQL_PS1 "\u@"(hostname -s)" [\d]> "

### App CLI

if [ (uname) = 'Darwin' ]
  if [ -e '/Applications/CotEditor.app/Contents/SharedSupport/bin' ]
    set PATH '/Applications/CotEditor.app/Contents/SharedSupport/bin' $PATH
  end
  if [ -e '/Applications/Sublime Text.app/Contents/SharedSupport/bin' ]
    set PATH '/Applications/Sublime Text.app/Contents/SharedSupport/bin' $PATH
  end
  if [ -e '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' ]
    set PATH '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' $PATH
  end
end

### Etc.

if test -e /opt/samba/bin
  set PATH /opt/samba/bin $PATH
end

if [ (uname) = 'Darwin' ]
  set -x CLOUDSDK_PYTHON /Users/ryo/.pyenv/versions/2.7.15/bin/python2.7
end
