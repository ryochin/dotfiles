# lang
alias be 'bundle exec --'
alias ber 'bundle exec -- ruby'
alias ce 'carton exec --'
alias cep 'carton exec -- perl -w'
alias iexm 'iex -S mix'
alias pd perldoc
alias pdm 'perldoc -m'
alias pdl 'perldoc -l'
alias rc 'rubocop -D'

# docker
alias dk docker
alias dkc docker-compose
alias dkm docker-machine

# editor
if [ -x /usr/local/bin/nano -o -x /usr/bin/nano ]
  export EDITOR="nano -w"
  alias ee $EDITOR
else if [ -x /usr/local/bin/ee ]
  export EDITOR=ee
else
  export EDITOR=vi
end

if [ -x /usr/local/bin/ee ]
  alias easyedit /usr/local/bin/ee
end

# ls
if test -e /usr/local/bin/exa
  alias d 'exa -lFg   --time-style iso'
  alias l 'exa -lFgah --time-style long-iso'
  alias lt 'exa -lFg --time-style iso -s modified -r'
  alias ltr 'exa -lFg --time-style iso -s modified'
else if test -x /usr/local/bin/gls
  alias d 'gls --color -lFg   --time-style iso'
  alias l 'gls --color -lFgah --time-style long-iso'
  alias lt 'gls --color -lFg   --time-style iso -t'
  alias ltr 'gls --color -lFg   --time-style iso -t -r'
else
  alias d 'ls -lF'
  alias l 'ls -lFA'
  alias lt 'ls -lF -t'
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
alias n bat
alias m $PAGER

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
alias tf 'tail -F -n 0'
alias ftp 'ncftp -L'
alias shredder 'shred -u -n 7'
alias kc 'knife solo cook --no-berkshelf --no-chef-check'
alias curl-head 'curl -D - -s -o /dev/null'
alias null 'cat /dev/null >'
alias files 'file ./* | egrep -v "(empty|directory|symbolic|Permission denied)" '
alias xmllint_html 'xmllint --html --noout'
alias swapinfo 'swapinfo -k'
alias webservice stacks-cli
alias aws='docker run -it --rm -v ~/.aws:/root/.aws -v $PWD:/aws amazon/aws-cli'

# OS specific
if [ (uname) = 'Darwin' ]
  alias o open
  alias ldd 'otool -L'
  alias notify "terminal-notifier -sound default -message"
  alias done "notify done!"

  # modern replacements
  alias ping 'prettyping --nolegend'
  alias du "ncdu --color dark -rr -x --exclude .git"
  alias ff '/usr/local/opt/fd/bin/fd'    # renamed: conflict with fdclone
  alias help tldr

  # app
  alias firefox 'open -a Firefox'
  alias chrome 'open -a Chrome'
  alias subl 'subl -n'
  alias youtube-dl 'youtube-dl -k'
  alias youtube-dl-mp4 'youtube-dl -k --recode-video mp4'
  alias amesh 'docker run -e TERM_PROGRAM --rm otiai10/amesh'
  alias stree /Applications/SourceTree.app/Contents/Resources/stree
else if [ (uname) = 'Linux' ]
  alias sc systemctl
  alias jc journalctl
end
