### Basic

set -x LANG en_US.UTF-8
set -x EDITOR vi
set -x PAGER "less -R"

set PATH /usr/sbin /usr/local/sbin /usr/libexec /usr/local/libexec $HOME/.local/bin $PATH

if test -e $HOME/bin
  set PATH $HOME/bin $PATH
end

# OrbStack
if test -e /Applications/OrbStack.app/Contents/MacOS/bin
  set PATH /Applications/OrbStack.app/Contents/MacOS/bin $PATH
  set PATH /Applications/OrbStack.app/Contents/MacOS/xbin $PATH
end

# Rancher Desktop
if test -e $HOME/.rd
  set PATH $HOME/.rd/bin $PATH
end

### Library

set -x LD_LIBRARY_PATH /usr/local/lib
set -x LIBRARY_PATH /usr/local/lib

### Homebrew

if [ (uname) = 'Darwin' ]
  if test -e /opt/homebrew
    set -x HOMEBREW_HOME (/opt/homebrew/bin/brew --prefix)
  else
    set -x HOMEBREW_HOME (/usr/local/bin/brew --prefix)
  end

  set PATH $HOMEBREW_HOME/bin $HOMEBREW_HOME/sbin $PATH
else
  set -x HOMEBREW_HOME /usr/local
end

### Homebrew: keg-only

set keg_list curl sqlite

for i in $keg_list
  if test -e /opt/homebrew/opt/$i/bin
    set PATH /opt/homebrew/opt/$i/bin $PATH
  else
    set PATH /usr/local/opt/$i/bin $PATH
  end
end

### Programming Languages

# Perl
set -x PERL_BADLANG 0
set -x PERLDOC_PAGER {$PAGER}

# Scala
if test -e $HOME/.conscript/bin
  set PATH $HOME/.conscript/bin $PATH
end

if test -e "$HOME/Library/Application Support/Coursier/bin"
  set PATH "$HOME/Library/Application Support/Coursier/bin" $PATH
end

# Eglang
set -x ERL_AFLAGS "-kernel shell_history enabled"

# Elixir
if test -e ~/.mix/escripts
  set PATH ~/.mix/escripts $PATH
end

# Java
if [ (uname) = 'Darwin' ]
  set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
else if [ (uname) = 'Linux' ]
  set -x JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-0.b14.el7_2.x86_64
end

# Go
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

export GOENV_ROOT="$HOME/.goenv"

if test -e /usr/local/go
  set PATH /usr/local/go/bin $PATH
end

# Rust
if test -e $HOME/.cargo/bin
  set PATH $HOME/.cargo/bin $PATH
end

# Python
if test -e $HOME/.rye/shims
  set PATH $HOME/.rye/shims $PATH
end

### texlive

if [ (uname) = 'Linux' ]
  if test -e /usr/local/texlive/2020/bin/x86_64-linux
    set PATH /usr/local/texlive/2020/bin/x86_64-linux $PATH
  end
end
if [ (uname) = 'Darwin' ]
  if test -e /usr/local/texlive/2020/bin/x86_64-darwin
    set PATH /usr/local/texlive/2020/bin/x86_64-darwin $PATH
  end
end

### Framework

set -x RAILS_DIFF "colordiff -u"

### CLI Options

set -x HOMEBREW_AUTO_UPDATE_SECS 21600

### MySQL

set -x MYSQL_PS1 "\u@"(hostname -s)" [\d]> "

### App CLI

if [ (uname) = 'Darwin' ]
  if test -e /Applications/CotEditor.app/Contents/SharedSupport/bin
    set PATH /Applications/CotEditor.app/Contents/SharedSupport/bin $PATH
  end
  if test -e /Applications/Sublime\ Text.app/Contents/SharedSupport/bin
    set PATH /Applications/Sublime\ Text.app/Contents/SharedSupport/bin $PATH
  end
  if test -e /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
    set PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH
  end
end

### Etc.

if test -e /opt/samba/bin
  set PATH /opt/samba/bin $PATH
end

if [ (uname) = 'Darwin' ]
  set -x CLOUDSDK_PYTHON $HOME/.asdf/shims/python2.7
end
