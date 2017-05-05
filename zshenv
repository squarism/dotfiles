# GENERAL SETTINGS
# -------------------------------
# local scripts can go in ~/bin
path+=~/bin

# local installs can go in ~/local instead of /usr/local
path+=~/local/bin

# this affects tmux+vim poorly, see tmux.conf for fixes
export TERM="xterm-256color"
export EDITOR="vim"
export ipaddr=`ifconfig en4 | grep inet | grep -v inet6 | cut -d" " -f 2`  # CHANGEME - interface assumption


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
alias ks='ls'
alias lks='ls'


# NODE.JS
# -------------------------------
# node version manager - optional, usually install this instead of the brew version
# source ~/.nvm/nvm.sh
# nvm use --silent 0.12.7
path+=~/node_modules/coffee-script/bin


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
alias start_consul='consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -ui-dir /opt/consul/ui -bind ${ipaddr}'
alias htop='sudo htop -d 5'
alias redis='redis-cli'


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
# Install a ruby with:
#   brew install ruby-build
#   ruby-build 2.4.1 ~/.rubies/ruby-2.4.1
#
# Updating ruby-build:
#   ruby-build --definitions needs to have the version you want.
#   git pull from that repo or re-run install.sh from ruby-build.
# ----------------------------------------------
source /usr/local/opt/chruby/share/chruby/chruby.sh  # this line will change depending on OS's.
chruby 2.4.1


# VM & VAGRANT ALIASES
# ----------------------------------------------
# alias bacon='ssh bacon@bacon'
# alias muffin='ssh muffin@muffin'
function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}


# base16 config
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
