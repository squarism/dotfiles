# homebrew install
eval (/opt/homebrew/bin/brew shellenv)

# fish stuff
source ~/.config/fish/path.fish
source ~/.config/fish/abbreviations.fish

# the way you set user paths is with fish_add_path
# either one-off in the shell or in configs

ulimit -n 8192
set -gx EDITOR vim

# mac's ifconfig is too noisy
alias ip 'ifconfig | grep -E "inet |en[0-9]:" | grep -v 127.0.0.1 | awk \'{if($1 ~ /en/){iface=$1} else if($1=="inet") print iface, $2}\''

# For specifics of job or project that are not interesting to anyone else
# and more importantly not checked into the dotfiles repo.
if test -e "$HOME/.box_specific.fish";
  source ~/.box_specific.fish
end

# use zoxide instead of fasd
zoxide init fish | source

# Use the language manager mise instead of asdf
# Installed with homebrew
# Homebrew handles activation but not completions apparently
mise completions fish | source

# Language settings

# go
set -x GOPATH ~/go
set -gx PATH $PATH ~/go/bin

# rust
fish_add_path $HOME/.cargo/bin

# crystal
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/openssl/lib/pkgconfig"

# All other languages managed with mise


# Fish shell customization
set fish_greeting ''
set -g theme_display_date no
set -g theme_powerline_fonts yes

# why is wezterm the only term that has a problem with the code alias?
set -gx PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH

# https://github.com/bigH/git-fuzzy
set PATH ~/local/git-fuzzy/bin $PATH

set -g GF_PREFERRED_PAGER "delta --theme=GitHub"


# TODO: not automated
# install fisher, then
# - fisher install zoxide/zoxide.fish
# ~ fisher install jorgebucaran/hydro

# change prompt symbol at start of line
set --universal hydro_symbol_prompt "›"


# better shell history with mcfly
mcfly init fish | source
set -gx MCFLY_LIGHT TRUE
set -gx MCFLY_RESULTS 50
set -gx MCFLY_KEY_SCHEME vim


# homebrew path override for GNU tools (for gnu-tar at the very least)
set PATH /opt/homebrew/opt/gnu-tar/libexec/gnubin $PATH
set PATH /opt/homebrew/opt/make/libexec/gnubin:$PATH

# curl CVE workaround
set gnucurl (brew --prefix curl)/bin/curl
alias curl $gnucurl

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME/bin
# pnpm end

set -gx PATH ~/.local/bin $PATH
