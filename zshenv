export PATH=~/bin:~/local/bin:/usr/local/sbin:/usr/local/bin:$PATH
export TERM="xterm-256color"


# NODE.JS
# -------------------------------
# node version manager
# source ~/.nvm/nvm.sh  # uncomment this if you use nvm
export PATH=~/node_modules/coffee-script/bin:/usr/local/share/npm/bin:$PATH
alias gupl='gulp'  # argh, typos.


# RUBY SPECIFICS
# -------------------------------
alias bi="b install --path vendor"
alias bil="bi --local"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias beg="bundle exec guard"

# handle case where older vi is installed (esp linux)
alias vi=vim

# I used to use the ZSH git plugin but don't know how to customize it
# So I just copied all the aliases I use often
alias g='git'
alias gca='git commit -v -a'
alias gss='git status -s'
alias gst='git status'
alias glg='git log --graph --oneline --all --abbrev-commit --decorate'
alias glgg='git log --graph --max-count=15'


# RVM
# ----------------------------------------------
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
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


# play! framework for scala
# ---------------------------------------------
# on a mac, you have to keep updating this with java updates.  :(
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home/
# path+=~/local/play-2.0.4
# export JAVA_OPTS="-Xms4g -Xmx8g"


# GOLANG
# ---------------------------------------------
 export GOPATH=~/src/go
 path+=~/src/go/bin


# GIT AUTHOR INFO
# ----------------------------------------------
# export GIT_AUTHOR_NAME='CHANGEME'
# export GIT_AUTHOR_EMAIL='changeme@changeme.com'
# export GIT_COMMITTER_NAME='CHANGEME'
# export GIT_COMMITTER_EMAIL='changeme@changeme.com'

 # amazon web services
 # export JAVA_HOME="$(/usr/libexec/java_home)"
 # export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
 # export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
 # export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

