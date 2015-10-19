# for zsh 5.0.0?
# autoload -Uz promptinit

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH tweaks
# ----------------------------------------------
# i don't like shared history between shells
unsetopt SHARE_HISTORY
setopt no_share_history
export DISABLE_AUTO_TITLE=true


source "$HOME/.antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle gem
antigen bundle golang
antigen bundle rake
antigen bundle knife

# Autojump support - takes you to common dir with j [space]
# `brew install autojump`
antigen bundle autojump

antigen theme squarism/dotfiles squarism
antigen-apply

# Everything else in ~/.zshenv
