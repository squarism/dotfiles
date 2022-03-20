# Dotfiles

My baseline configs for fresh boxes.  This repo can be used to
re-baseline a box but it'll stomp on your vim config (after backing it up).
So this is primarily a "fresh machine" kinda of thing.

  * zsh - Awesome shell.  Needs oh-my-zsh.
  * tmux - Beats screen.  Easy split mode and pane switching.
  * vim config that uses codegram/vimfiles setup.
  * rvm - For managing multiple ruby installs. I flip-flop on rbenv vs rvm.
  * weechat and irssi IRC defaults.
  * gemrc - Gets rid of documentation on Ruby gems.


## Install

I'm assuming a clean box here.  **Please** backup your files or really read what these things do.

  * Get a version of ZSH 4.3.9+ installed (5.0.0 is ok too)
  * Get a version of NeoVim installed with Lua support (0.5+)
  * Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) like normal
    * curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  * Install [antigen](https://github.com/zsh-users/antigen):
    * `mkdir ~/.antigen`
    * `curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen/antigen.zsh`
  * Put my dotfiles into place:
    * `bash install.sh`  (destroys .vimrc)

Instead of ZSH, lately I've been using Fish but I need to switch back to ZSH.

## Tmux

I stole so much from  sorin-ionescu/dot-files here.  I changed a few things here.  Like got rid of mouse switching.  Ctrl-L which normally clears the shell screen switches panes which is a minor concession.  Vim navigation all over the place.  It's well documented from sorin.


## Languages
I do not use RVM gemsets and instead prefer bundler/Gemfile.  It's only
annoying for main-style scripts (since you don't have a project
directory).


## NeoVim

Copy the vim config into `~/.config/nvim/init.vim`.  Then run `:call dein#update()`


## Themes

You will probably pick the them you like.  I like a light theme for usability even if I do prefer dark themes.
This might change.

What I wanted to point out here is that base-16 themes in the shell usually are enough to set the theme.  In the past, I used iTerm themes to set the shell theme.

Current Combo:
  * Fish - base16-harmonic-light (gnuykeaj theme with `omf install gnuykeaj`) but modified the `>` character at the end.  How to do this is in `fish/config.fish` at the bottom.
  * neovim - base16-harmonic-light
  * lualine (neovim) - ayu_light


Phoenix
-----
[Phoenix](https://github.com/jasonm23/phoenix) allows you to quickly
arrange windows on OSX, sort of like Xmonad.  You'll need to install it
first (the instructions are easy).  The
[config I use](https://github.com/jasonm23/Phoenix-config/blob/master/.phoenix.litcoffee)
is from the wiki there.  The original is in coffeescript and has to be
compiled to JS.  The phoenix.js file in this repo is already convered
and edited a little bit.  Here are the key-combinations I use everyday.

> Ctrl-Shift starts everything.  By default, it's Ctrl-Alt-Cmd but this conflicts with TotalSpaces2.

    Ctrl-Shift-Left Arrow = Push window to the left
    Ctrl-Shift-Right Arrow = Push window to the right

    You can move a window into quads with these four keys:
    Ctrl-Shift+ ...
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
