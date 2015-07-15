The Premier Hipsterware Dotfiles Repo™
===========

My hipsterware stack.

  * zsh - Awesome shell.  Needs oh-my-zsh.
  * tmux - Beats screen.  Easy split mode and pane switching.
  * vim config that uses codegram/vimfiles setup.
  * rvm - For managing multiple ruby installs. I flip-flop on rbenv vs rvm.
  * weechat and irssi IRC defaults.
  * gemrc - Gets rid of documentation on Ruby gems.


Install
-------
I'm assuming a clean box here.  **Please** backup your files or really read what these things do.

  * Get a version of ZSH 4.3.9+ installed (5.0.0 is ok too)
  * Get a version of Vim 7.3 installed (7.2 and older is not ok)
    * ./configure needs to have at least --features=big and --enable-multibyte
    * I usually configure like this on a box with older packages:

      `./configure --with-features=huge --enable-multibyte --prefix=$HOME/local`
      * Then add ~/local/bin to your path
    * If you can install 7.3 or newer with apt-get or yum, skip compiling.
    * If you installed vim with homebrew, skip compiling.
  * Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) like normal
    * curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  * Install [janus vim](https://github.com/carlhunda/janus) like normal (if you trust them there is a shorter step described on their github page)
    * `curl -Lo- https://bit.ly/janus-bootstrap | bash`
    * Add extras to the janus dir (won't exist, so create it)
      * `mkdir ~/.janus; cd !$`
      * `git clone https://github.com/bling/vim-airline`
  * Put my dotfiles into place:
    * `bash install.sh`  (destroys .vimrc)


Tmux
----
I stole so much from  sorin-ionescu/dot-files here.  I changed a few things here.  Like got rid of mouse switching.  Ctrl-L which normally clears the shell screen switches panes which is a minor concession.  Vim navigation all over the place.  It's well documented from sorin.


RVM
-----
I do not use RVM gemsets and instead prefer bundler/Gemfile.  It's only
annoying for main-style scripts (since you don't have a project
directory).


Janus Vim
-----
If you use janus vim instead of the above vim config from codegram:

    cp janus.vimrc.after ~/.vimrc.after

Download the jellybeans iTerm2 theme from [here](https://github.com/qtpi/Jellybeans.itermcolors)

    wget https://raw.githubusercontent.com/qtpi/Jellybeans.itermcolors/master/jellybeans.itermcolors


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
    
