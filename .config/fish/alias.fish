# lang
alias be 'bundle exec --'
alias ber 'bundle exec -- ruby'
alias ce 'carton exec --'
alias cep 'carton exec -- perl -w -Ilib,extlib'
alias iexm 'iex -S mix'
alias pd perldoc
alias pdm 'perldoc -m'
alias pdl 'perldoc -l'
alias rc 'bundle exec rubocop -D'

# docker
alias dk docker
alias dkm docker-machine

if test -x /usr/local/bin/docker-compose
  alias dkc docker-compose
else
  alias dkc 'docker compose'
end

# editor
if test -x /usr/local/bin/nano -o -x /usr/bin/nano -o -x /bin/nano -o -x $HOMEBREW_HOME/nano
  export EDITOR=nano
  alias ee $EDITOR
else
  export EDITOR=vi
end

# ls
if test -x ~/bin/eza -o -x /usr/local/bin/eza -o -x $HOMEBREW_HOME/bin/eza
  alias d   'eza -F -lg     --git --time-style iso'
  alias l   'eza -F -lgah   --git --time-style long-iso'
  alias lt  'eza -F -lg     --git --time-style iso -s modified -r'
  alias ltr 'eza -F -lg     --git --time-style iso -s modified'
else if test -x /usr/local/bin/exa -o -x $HOMEBREW_HOME/bin/exa
  alias d   'exa -lFg     --git --time-style iso'
  alias l   'exa -lFgah   --git --time-style long-iso'
  alias lt  'exa -lFg     --git --time-style iso -s modified -r'
  alias ltr 'exa -lFg     --git --time-style iso -s modified'
else if test -x /usr/local/bin/gls -o -e $HOMEBREW_HOME/bin/gls
  alias d   'gls --color -lFg   --time-style iso'
  alias l   'gls --color -lFgah --time-style long-iso'
  alias lt  'gls --color -lFg   --time-style iso -t'
  alias ltr 'gls --color -lFg   --time-style iso -t -r'
else
  alias d   'ls -lF'
  alias l   'ls -lFA'
  alias lt  'ls -lF -t'
  alias ltr 'ls -lF -t -r'
end

alias tree 'tree -CF'

# ps
alias pa 'ps aux'
alias psg psgrep

# grep, ag
alias g  'grep'
alias gg 'grep -an -B 5 -A 5'
alias gl 'grep --line-buffered'
alias ag 'ag --color-match "4;33"'
alias agq 'ag -Q'

# unix commands
alias c cat
alias b 'bat -P'

if test -x /usr/local/bin/colordiff
  alias diff '/usr/local/bin/colordiff -NBaur'
else if test -x $HOMEBREW_HOME/opt/colordiff/bin/colordiff
  alias diff '/opt/homebrew/opt/colordiff/bin/colordiff -NBaur'
end

alias ns netstat
alias mv 'mv -i'
alias rm 'rm -i'
alias h head
alias s sort
alias t tail
alias mtail multitail
alias mp multipass

# pager
if test -x $HOMEBREW_HOME/bin/bat
  alias n $HOMEBREW_HOME/bin/bat
else if test -x /usr/local/bin/bat
  alias n /usr/local/bin/bat
else
  alias n $PAGER
end

alias m $PAGER

# git
alias ggs   'git status'
alias ggsu  'git status --untracked-files=no'
alias ggd   'git diff'
alias ggdw  'git diff -w --word-diff color'
alias ggdc  'git diff --cached'
alias ggdcw 'git diff --cached -w --word-diff=color'
if test -x $HOMEBREW_HOME/bin/difft
  alias ggdt   'git dft'
  alias ggdtc  'git dft --cached'
end

# alias ggb   'git branch'
alias ggl   'git log --name-status'
alias gglt  'git log --graph --decorate --oneline'
alias ggg   'git grep -ni'
alias gb    git-branch-activity

# add options
alias df 'df -h'
alias du 'du -kh'
alias diff 'diff -NBaur'
alias htop 'htop -d 10'
alias ctop 'ctop -a'
alias scp 'scp -p'
alias ffmpeg 'ffmpeg -hide_banner'
alias ffprobe 'ffprobe -hide_banner'
alias glances 'glances -1 -t 5 --disable-bg --disable-webui'
alias pwgen 'pwgen -B'
alias ncdu "ncdu --color dark -rr -x --exclude .git"
alias duf "duf --only-mp '/,/disk,/Volumes/Cache'"

# others
alias root 'su -l'
alias tt 'tail -48'
alias tf 'tail -F -n 0'
alias ftp 'ncftp -L'
alias shredder 'shred -u -n 7'
alias kc 'knife solo cook --no-berkshelf --no-chef-check'
alias curl-head 'curl -D - -s -o /dev/null'
alias null 'truncate -s 0'
alias files 'file ./* | egrep -v "(empty|directory|symbolic|Permission denied)" '
alias xmllint_html 'xmllint --html --noout'
alias webserver miniserve
alias kamal "docker run -it --rm -v '$PWD:/workdir' -v '$SSH_AUTH_SOCK:/ssh-agent' \
  -v /var/run/docker.sock:/var/run/docker.sock -e 'SSH_AUTH_SOCK=/ssh-agent' ghcr.io/basecamp/kamal:latest"
alias trf terraform
alias tg terragrunt

# OS specific
if [ (uname) = 'Darwin' ]
  alias o open
  alias ldd 'otool -L'
  alias notify "terminal-notifier -sound default -message"
  alias done "notify done!"
  alias help tldr
  alias vmstat /usr/bin/vm_stat
  alias strace /usr/bin/dtruss

  # modern replacements
  alias ping 'prettyping --nolegend'

  # renamed: conflict with fdclone
  if test -x $HOMEBREW_HOME/opt/fd/bin/fd
    alias ff $HOMEBREW_HOME/opt/fd/bin/fd
  end

  # app
  alias firefox 'open -a Firefox'
  alias chrome 'open -a Chrome'
  alias vlc 'open -a VLC'
  alias subl 'subl -n'
  alias youtube-dl 'yt-dlp -k'
  alias youtube-dl-mp4 'yt-dlp -k --recode-video mp4'
  alias amesh 'docker run -e TERM_PROGRAM --rm otiai10/amesh'
  alias stree /Applications/SourceTree.app/Contents/Resources/stree

  # etc
  alias aws 'docker run -it --rm -v ~/.aws:/root/.aws -v $PWD:/root awscli:latest'
else if [ (uname) = 'Linux' ]
  alias sc systemctl
  alias jc journalctl

  alias swapinfo 'swapinfo -k'

  if test -x /usr/bin/fdfind
    alias ff /usr/bin/fdfind
  else if test -x /usr/local/bin/fdfind
    alias ff /usr/local/bin/fdfind
  end
end
