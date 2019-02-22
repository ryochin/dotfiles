# lang
alias be 'bundle exec --'
alias ber 'bundle exec -- ruby'
alias ce 'carton exec --'
alias cep 'carton exec -- perl -w'
alias im 'iex -S mix'
alias pd perldoc
alias pdm 'perldoc -m'
alias pdl 'perldoc -l'
alias rubocop 'rubocop -D'

# docker
alias dk docker
alias dkc docker-compose
alias dkm docker-machine

# editor
if [ -x /usr/local/bin/ee -o -x /usr/bin/ee ]
  export EDITOR=ee
else
  export EDITOR=vi
  alias ee 'nano -w'
end

# ls
if [ -x /usr/local/bin/gls ]
  alias ls '/usr/local/bin/gls --color'
end

alias dir 'ls -lF'
alias dh  'dir -h'
alias d   dir

alias l    'ls -lFA'
alias lr   'ls -RF'
alias lf   'ls -AF'
alias lt   'ls -lFAt'
alias ltr  'ls -lFAtr'
alias lss  'ls -lF | sort -n +4'
alias lssr 'ls -lF | sort -nr +4'

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
if [ -x /usr/local/bin/ccat ]
  alias c ccat
else
  alias c cat
end

if [ -x /usr/local/bin/colordiff ]
  alias diff "/usr/local/bin/colordiff -NBaur"
end

alias ns netstat
alias mv 'mv -i'
alias rm 'rm -i'
alias h head
alias j 'jobs -l'
alias s sort
alias t tail
alias mtail multitail

# pager
alias n nmore
alias m $PAGER
alias tm tmore

# git
alias ggs   'git status'
alias ggd   'git diff'
alias ggdw  'git diff -w --word-diff color'
alias ggdc  'git diff --cached'
alias ggdcw 'git diff --cached -w --word-diff=color'
alias ggb   'git branch'
alias ggl   'git log --name-status'
alias ggg   'git grep -ni'
alias lg    'lazygit'
alias gb    git-branch-activity

# add options
alias df 'df -h'
alias du 'du -kh'
# alias diff 'diff -NBaur'
alias htop 'htop -d 10'
alias ctop 'ctop -a'
alias scp 'scp -p'
alias ffmpeg 'ffmpeg -hide_banner'
alias ffprobe 'ffprobe -hide_banner'
alias rubocop 'rubocop -D'
alias glances 'glances -1 -t 2 --disable-bg'
alias pwgen 'pwgen -B'

# others
alias root 'su -l'
alias tt 'tail -48'
alias tf 'tail -f -0'
alias ftp 'ncftp -L'
alias shredder 'shred -u -n 7'
alias kc 'knife solo cook --no-berkshelf --no-chef-check'
alias curl-head 'curl -D - -s -o /dev/null'
alias null 'cat /dev/null >'
alias files 'file ./* | egrep -v "(empty|directory|symbolic|Permission denied)" '
alias xmllint_html 'xmllint --html --noout'
alias swapinfo 'swapinfo -k'
alias webservice stacks-cli

# macOS
if [ (uname) = 'Darwin' ]
  alias o open
  alias ldd 'otool -L'

  alias notify "terminal-notifier -sound default -message"
  alias done "notify done!"

  # app
  alias ff 'open -a Firefox'
  alias ch 'open -a Chrome'
  alias subl 'subl -n'
  alias youtube-dl 'youtube-dl --recode-video mp4'
  alias amesh 'docker run -e TERM_PROGRAM --rm otiai10/amesh'
  alias stree /Applications/SourceTree.app/Contents/Resources/stree
end
