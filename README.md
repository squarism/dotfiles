# Dotfiles

My baseline configs for fresh boxes.  This repo can be used to
re-baseline a box but it'll stomp on your vim config (after backing it up).
So this is primarily a "fresh machine" kinda of thing.

  * fish
  * fisher fish package manager
  * neovim config
  * phoenix (ignore AeroSpace)
  * gitconfig

Main system dependencies are done in `Brewfile`.  For example, things that my Fish config expects.

The rest of the configs are vestigal and will be removed one day:
  * zsh
  * weechat and irssi IRC defaults.
  * gemrc - Gets rid of documentation on Ruby gems.


## Install

I used to have an install script but things have simplified a bunch and I don't have CI for new boxes.

Most things go in `~/.config` and this repo does not mirror a home dir necessarily.


## Fish

I use very few fish plugins.  I find [fisher](https://github.com/jorgebucaran/fisher) to be the easiest to install and write for so that's what I use.

* [zoxide](https://github.com/kidonng/zoxide.fish)
* [hydro](https://github.com/jorgebucaran/hydro) - fish prompt
* my own [lockrebase](https://github.com/squarism/lockrebase) ;)


## NeoVim

Copy the vim config into `~/.config/nvim/init.vim`.  Then run `:call dein#install()`.
There is a cheatsheet.
`cp neovim/cheatsheet.txt ~/.config/nvim`
Access the cheatsheet with `<leader>?`.  Leader is `,`.


## Themes

You will probably pick the theme you like.  I like a light theme for consistency because of the web even if I do prefer dark themes.
This might change.

💡 In the past, I used to use base16 themes to set the shell theme and ignore iTerm.  I have flip-flopped on this but have found that having iTerm2 set the theme is the best for consistency.

Current Theme Setup (this changes often):

  * Fish - ([pure](https://github.com/pure-fish/pure) theme installed with `fisher`)
  * neovim - base16-harmonic-light
  * lualine (neovim) - ayu_light
  * iTerm2 - Either [Ayu Mirage](https://github.com/michelegera/iterm2-ayu-mirage) for a light theme or a combo of gruvbox themes for iTerm2, vim and vscode for a dark theme.


## Aerospace

I switched from [Phoenix](https://github.com/jasonm23/phoenix) to Aerospace.
Aerospace seems to fill both needs of arrangement that Phoenix does and replacing the slow animation speed of
Spaces.

_nope: I'm still using phoenix with slow animation_

I started off with the [default
config](https://github.com/nikitabobko/AeroSpace/blob/main/docs/config-examples/default-config.toml) as it
seems to do what I need it to do.  This repo will track any customizations I do.

    # install aerospace, follow their instructions

    # copy the config from this repo into place
    mkdir ~/.config/aerospace
    cp aerospace.toml ~/.config/aerospace
    # reload aerospace from the menubar option


## Irssi

My config just adds a shortcut for freenode to auto-authenticate.
This can also be achieved by doing this:

```
# while connected to freenode and after registering etc (or any IRC network)
/network add -autosend "/^msg NickServ identify yourpassword"
/save
```

Edit ~/.irssi/config and change the `CHANGEME` bits.

## Tmux

I stole so much from  sorin-ionescu/dot-files here.  I changed a few things here.  Like got rid of mouse switching.  Ctrl-L which normally clears the shell screen switches panes which is a minor concession.  Vim navigation all over the place.  It's well documented from sorin.


## Terminal

I like ghostty but the terminfo thing is annoying, wezterm for now even though it doesn't have a quick
terminal which I would really like for my devlog thing (on my blog).  Ghostty seems to burn energy
with no process in it.


## Languages

I use `mise` for all language installers.  The list of languages is not listed here but attempted in `mise.toml`.
