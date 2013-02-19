export PATH=~/bin:~/local/bin:/usr/local/sbin:/usr/local/bin:$PATH
export TERM="xterm-256color"


# NODE.JS
# -------------------------------
# node version manager
# source ~/.nvm/nvm.sh
export PATH=~/node_modules/coffee-script/bin:/usr/local/share/npm/bin:$PATH


# RUBY SPECIFICS
# -------------------------------
# never forget global gemset in rbenv @joefiorini
# write-gemset () {
#   echo "$1 global" > .rbenv-gemsets
# }
# export PATH=$HOME/.rbenv/bin:$PATH
# from ryan.mcgeary.org
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

# handle case where older vi is installed (esp linux)
alias vi=vim


# RBENV
# ----------------------------------------------
# export PATH=$HOME/.rbenv/bin:$PATH
# eval "$(rbenv init -)"
# # ruby-build plugin for rbenvand etc
# if [ -d "$HOME/local/bin" ] ; then
#   PATH="$HOME/local/bin:$PATH"
# fi
# alias gemset='rbenv gemset active'


# RVM
# ----------------------------------------------
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias gemset='rvm gemset name'


# ZSH tweaks
# ----------------------------------------------
# i don't like shared history between shells
unsetopt SHARE_HISTORY


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

# GIT AUTHOR INFO
# ----------------------------------------------
# export GIT_AUTHOR_NAME='CHANGEME'
# export GIT_AUTHOR_EMAIL='changeme@changeme.com'
# export GIT_COMMITTER_NAME='CHANGEME'
# export GIT_COMMITTER_EMAIL='changeme@changeme.com'

