source ~/.config/fish/path.fish
source ~/.config/fish/abbreviations.fish

ulimit -n 8192
set -gx EDITOR vim

# Change to autojump default keybindings for the z plugin
set -U Z_CMD "j"

# For specifics of job or project that are not interesting to anyone else
# and more importantly not checked into the dotfiles repo.
if test -e "$HOME/.work_specific.fish";
  source ~/.work_specific.fish
end

# asdf for all program language management except for: 
# python (awscli) and rust (rustup) and java (bleh, terrible plugin)
source /usr/local/opt/asdf/asdf.fish

# Go
set -x GOPATH ~/go
set -gx PATH $PATH ~/go/bin

# Rust
set PATH $HOME/.cargo/bin $PATH

# Crystal
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

# Node
# set PATH ~/.asdf/installs/nodejs/9.11.2/.npm/bin $PATH

# Java
set PATH $HOME/.jenv/bin $PATH

# Ruby
# chruby 2.6.3


# Fish shell customization
set fish_greeting ''
set -g theme_display_date no
set -g theme_powerline_fonts yes

# Base16 Shell
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-ia-light.sh
end
