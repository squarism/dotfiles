# Dotfiles

My baseline configs for fresh boxes.  This repo can be used to
re-baseline a box but it'll stomp on your vim config (after backing it up).
So this is primarily a "fresh machine" kinda of thing.

  * fish
  * fisher fish package manager
  * neovim config
  * phoenix desktop manager
  * gitconfig

The rest of the configs are vestigal and will be removed one day:
  * zsh
  * weechat and irssi IRC defaults.
  * gemrc - Gets rid of documentation on Ruby gems.


## Install

I used to have an install script but things have simplified a bunch and I don't have CI for new boxes.


## Fish

I use very few fish plugins.  I find [fisher](https://github.com/jorgebucaran/fisher) to be the easiest to install and write for so that's what I use.

* [zoxide](https://github.com/kidonng/zoxide.fish)
* [pure](https://github.com/pure-fish/pure)
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


Phoenix
-----
[Phoenix](https://github.com/jasonm23/phoenix) allows you to quickly
arrange windows on OSX, sort of like Xmonad.  You'll need to install it
first (the instructions are easy).  The
[config I use](https://github.com/jasonm23/Phoenix-config/blob/master/.phoenix.litcoffee)
is from the wiki there.  The original is in coffeescript and has to be
compiled to JS.  The phoenix.js file in this repo is already convered
and edited a little bit.  Here are the key-combinations I use everyday.

> Ctrl-Option-Command starts everything.  From here on out, Ctrl-Option-Command is "mash".

    <Mash> + Left Arrow = Push window to the left
    <Mash> + Right Arrow = Push window to the right

    You can move a window into quads with these four keys:
    <Mash> + ...
                   Screen Corners
                  ----------------
                  |  Q   |   W   |
                  |  A   |   S   |
                  ----------------

The rest of the keys are on the wiki (with a nice diagram too).

The installer does not copy this file as it's not really "unixy".  If you use Phoenix or just want to try using a nice starting config, copy it and Phoenix will automatically load it.

  cp phoenix.js ~/.phoenix.js


Irssi
---
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


## Languages

I use `asdf` for all language installers.  The list of languages is not listed here.
