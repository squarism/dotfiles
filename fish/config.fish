source ~/.config/fish/path.fish
source ~/.config/fish/abbreviations.fish

ulimit -n 8192
set -gx EDITOR vim

# For specifics of job or project that are not interesting to anyone else
# and more importantly not checked into the dotfiles repo.
if test -e "$HOME/.work_specific.fish";
  source ~/.work_specific.fish
end

# use zoxide instead of fasd
zoxide init fish | source
alias j z

# asdf for all program language management except for: 
# python (awscli) and java (bleh, terrible plugin)
source /usr/local/opt/asdf/asdf.fish

# Go
set -x GOPATH ~/go
set -gx PATH $PATH ~/go/bin

# Rust
set PATH $HOME/.cargo/bin $PATH

# Crystal
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

# Java
set PATH $HOME/.jenv/bin $PATH

# Node - is asdf managed
# Ruby - is asdf managed
# Python - is asdf managed with poetry


# Fish shell customization
set fish_greeting ''
set -g theme_display_date no
set -g theme_powerline_fonts yes
# function fish_right_prompt
  # intentionally left blank
# end

# Base16 Shell
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-harmonic-light.sh
end

# https://github.com/bigH/git-fuzzy
set PATH ~/local/git-fuzzy/bin $PATH
set -g GF_PREFERRED_PAGER "delta --theme=GitHub"


# TODO: not automated install instructions:
# omf install gnuykeaj
#   omf theme gnuykeaj
#   sed ) to > in ~/.local/share/omf/themes/gnuykeaj
# omf install fzf
