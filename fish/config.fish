source ~/.config/fish/path.fish
source ~/.config/fish/abbreviations.fish

# the way you set user paths is with fish_add_path
# either one-off in the shell or in configs

ulimit -n 8192
set -gx EDITOR vim

# For specifics of job or project that are not interesting to anyone else
# and more importantly not checked into the dotfiles repo.
if test -e "$HOME/.work_specific.fish";
  source ~/.work_specific.fish
end

# use zoxide instead of fasd
zoxide init fish | source
# yer just going to have to get used to it
# learn z so that zi becomes natural
alias j z


# rtx for all language installs except the ones below
# rtx is installed with homebrew
rtx activate -q fish | source

# Go
set -x GOPATH ~/go
set -gx PATH $PATH ~/go/bin

# Rust
set PATH $HOME/.cargo/bin $PATH

# Crystal
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

# Java
set PATH $HOME/.jenv/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH



# Fish shell customization
set fish_greeting ''
set -g theme_display_date no
set -g theme_powerline_fonts yes


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

# fzf does not seem to cleanly uninstall
# omf install fzf


# better shell history with mcfly
mcfly init fish | source
set -gx MCFLY_LIGHT TRUE
set -gx MCFLY_RESULTS 50
set -gx MCFLY_DISABLE_MENU TRUE


# homebrew (for gnu-tar at the very least)
set PATH /opt/homebrew/opt/gnu-tar/libexec/gnubin $PATH


# curl CVE workaround
set gnucurl (brew --prefix curl)/bin/curl
alias curl $gnucurl
