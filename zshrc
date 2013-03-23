# for zsh 5.0.0?
autoload -Uz promptinit

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallifrey"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate ruby bundler autojump)

source $ZSH/oh-my-zsh.sh

# Autojump support - takes you to common dir with j [space]
# `brew install autojump`
[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Customize to your needs...
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


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# i don't like shared history between shells
unsetopt SHARE_HISTORY

# amazon web services
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
