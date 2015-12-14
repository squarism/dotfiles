# GENERAL SETTINGS
# -------------------------------
# local scripts can go in ~/bin
path+=~/bin

# local installs can go in ~/local instead of /usr/local
path+=~/local/bin

# this affects tmux+vim poorly, see tmux.conf for fixes
export TERM="xterm-256color"
export EDITOR="vim"

# tree shortcut (list file tree in not useless infinite recursive way)
function t() {
  dir="."
  if [ ! -z $1 ]; then
    dir=$1
  fi
  tree -F -L 2 $dir
}


# EMBRACING TYPOS - analyze your shell history every once and a while and see what typos you make
# -------------------------------
alias gupl='gulp'
alias ks='ls'
alias lks='ls'


# NODE.JS
# -------------------------------
# node version manager - optional, usually install this instead of the brew version
# source ~/.nvm/nvm.sh
# nvm use --silent 0.12.7

path+=~/node_modules/coffee-script/bin
alias gupl='gulp'   # argh, typos.
alias node='nodejs' # for certain package managers that install it as nodejs


# RUBY SPECIFICS
# -------------------------------
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias beg="bundle exec guard"

# handle case where older vi is installed (esp linux)
alias vi=vim

# I used to use the ZSH git plugin but don't know how to customize it, so I copied oft-used aliases
alias g='git'
alias gst='git status'
alias glg='git log --graph --oneline --decorate --color'
alias glgg='git log --graph --max-count=15'
alias gpr="git pull --rebase --prune"
# glt will list the commits between the latest tag and the previous tag. Helpful for when you're about to deploy.
alias glt='git log $(git describe --tags --abbrev=0 $(git describe --tags)^)..$(git describe --tags)'
# alias gyolo='git commit -a -m "$(curl -s whatthecommit.com/index.txt)"'  # ha


# GENERAL COMMANDS
# ----------------------------------------------
alias flushdns='sudo killall -HUP mDNSResponder'
alias vi=vim  # handle case where older vi is installed (esp linux)
alias ipaddr=`ifconfig en4 | grep inet | grep -v inet6 | cut -d" " -f 2`  # CHANGEME - interface assumption
alias start_consul='consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -ui-dir /opt/consul/ui -bind ${ipaddr}'
alias htop='sudo htop -d 5'
alias redis='redis-cli'


# RVM
# ----------------------------------------------
alias gemset='rvm gemset name'


# ZSH tweaks
# ----------------------------------------------
# i don't like shared history between shells
unsetopt SHARE_HISTORY
setopt no_share_history


# PYTHON
# ----------------------------------------------
# virtualenv stuff
# PATH=${PATH}:/usr/local/share/python

# Before other PATHs...
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# export PIP_RESPECT_VIRTUALENV=true
# if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
#   source /usr/local/share/python/virtualenvwrapper.sh
# else
#   echo "WARNING: Can't find virtualenvwrapper.sh"
# fi


# GOLANG
# ---------------------------------------------
export GOPATH=~/src/go
path+=~/src/go/bin
path+=~/local/go/bin


# GIT AUTHOR INFO
# ----------------------------------------------
# export GIT_AUTHOR_NAME='CHANGEME'
# export GIT_AUTHOR_EMAIL='changeme@changeme.com'
# export GIT_COMMITTER_NAME='CHANGEME'
# export GIT_COMMITTER_EMAIL='changeme@changeme.com'


# RUBY
# ----------------------------------------------
# chruby init
#   Install a ruby with:                                                                                                                                 #   brew install ruby-build
#   ruby-build 2.1.6 ~/.rubies/ruby-2.1.6
# ----------------------------------------------
source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 2.1.6


# VM & VAGRANT ALIASES
# ----------------------------------------------
# alias bacon='ssh bacon@bacon'
# alias muffin='ssh muffin@muffin'
function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}


# fuzzy finder with fzf
# ----------------------------------------------
# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
