# homebrew install
eval (/opt/homebrew/bin/brew shellenv)

# fish stuff
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

# asdf every-language manager `brew install asdf`
# previously rtx (now mise), previously asdf, round and round we go
source /opt/homebrew/opt/asdf/libexec/asdf.fish


# Go
set -x GOPATH ~/go
set -gx PATH $PATH ~/go/bin

# Rust
set PATH $HOME/.cargo/bin $PATH
# so rtx installs don't get warnings when upgrading
set -x RUSTUP_INIT_SKIP_PATH_CHECK yes
alias rust-musl-builder 'docker run --rm -it -v "$(pwd)":/home/rust/src messense/rust-musl-cross:x86_64-musl'

# Crystal
# set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/openssl/lib/pkgconfig"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH



# Fish shell customization
set fish_greeting ''
set -g theme_display_date no
set -g theme_powerline_fonts yes


# Base16 Shell
# ok, so here's the deal.  We could set the colors inside the shell
# but then it impacts other apps like the terminal in vscode
# so why not just set colors in iTerm2 itself?  I used to do this
# and thought the shell was cooler.  But now I see the problem.
# Also, doesn't this run on init everytime?!
# Grab `Horizon` from https://github.com/slavkobojanic/horizon-iterm

# if status --is-interactive
#  eval sh $HOME/.config/base16-shell/scripts/base16-material.sh
# end

# https://github.com/bigH/git-fuzzy
set PATH ~/local/git-fuzzy/bin $PATH
set -g GF_PREFERRED_PAGER "delta --theme=GitHub"


# TODO: not automated
# install fisher, then
# - fisher install kidonng/zoxide.fish
# - fisher install pure-fish/pure
#   (tide configure)

 # TODO: what is fish trying to do here?
 # if status is-interactive
 # end

# better shell history with mcfly
mcfly init fish | source
# on a light theme, enable this
# set -gx MCFLY_LIGHT FALSE
set -gx MCFLY_RESULTS 50
set -gx MCFLY_KEY_SCHEME vim


# homebrew (for gnu-tar at the very least)
# set PATH /opt/homebrew/opt/gnu-tar/libexec/gnubin $PATH


# curl CVE workaround, install curl 8.4.0+ with homebrew
set gnucurl (brew --prefix curl)/bin/curl
alias curl $gnucurl
