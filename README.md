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


## Install

I used to have an install script but things have simplified a bunch and I don't have CI for new boxes.

This repo tries to mirror a home.

```
config/*   --> ~/.config/*
gitconfig  --> ~/.gitconfig

# I used to have a folder called bin
# and that would not be installed as a "dot file"
# but now I used fish abbr
# these might come back one day
bin/*        --> ~/bin/*  # commands, nothing right now
```


## Fish

I use very few fish plugins.  I find [fisher](https://github.com/jorgebucaran/fisher) to be the easiest to install and write for so that's what I use.

* [zoxide](https://github.com/kidonng/zoxide.fish)
* [hydro](https://github.com/jorgebucaran/hydro) - fish prompt
* my own [lockrebase](https://github.com/squarism/lockrebase) plugin ;)


## NeoVim

Copy the vim config into `~/.config/nvim/init.vim`.  Then run `:call dein#install()`.

There is a cheatsheet for keys, which I use myself quite often:
- `cp neovim/cheatsheet.txt ~/.config/nvim`
- Access the cheatsheet with `<leader>?`.  Leader is `,`.


## Themes

You will probably pick the theme you like so I won't even try to list what I use.  It changes quite often.  On some machines, I go all light-mode.  Other times, dark-mode.

💡 In the past, I used to use _base16 themes_ to set the shell theme and ignore the terminal's theme (iTerm, Ghostty, Wezterm).  I have flip-flopped on this but have found that having Ghostty (the terminal) set the theme is the best for consistency.


## Phoenix

[Phoenix](https://github.com/jasonm23/phoenix) is a window manager for mac, not quite tiling.

I have tried Aerospace but I'm still using phoenix with slow animation.

`~/.phoenix.js`


## Terminal

Ghostty is improving all the time.  I used to use iTerm2 and then Wezterm.


## Languages

I use `mise` for all language installers.  The list of languages is not listed here but attempted in `mise.toml`.
