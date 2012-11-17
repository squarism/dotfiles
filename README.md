Me Dotfiles
===========

My hipsterware stack.

  * zsh - Awesome shell.  Needs oh-my-zsh.
  * tmux - Beats screen.  Easy split mode and pane switching.
  * vim config that uses codegram/vimfiles setup.
  * rbenv - For managing multiple ruby installs.
  * weechat and irssi IRC defaults.
  * gemrc - Gets rid of documentation on Ruby gems.
  * irbrc - Ruby REPL niceness.
  
Install
-------
I'm assuming a clean box here.  **Please** backup your files or really read what these things do.

  * Get a version of ZSH 4.3.9+ installed (5.0.0 is ok too)
  * Get a version of Vim 7.3 installed (7.2 and older is not ok)
    * ./configure needs to have at least --features=big and --enable-multibyte
    * I usually configure like this:
    
      `./configure --with-features=huge --enable-multibyte --enable-clipboard=yes --enable-xterm_clipboard=yes`
    * If you installed vim with homebrew, skip all the above
  * Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) like normal
    * curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  * Install [codegram/vimfiles](https://github.com/codegram/vimfiles) like normal (if you trust them there is a shorter step described on their github page)
    * manual way:
    * git clone https://github.com/codegram/vimfiles.git ~/.vim
    * ln -s ~/.vim/vimrc ~/.vimrc
    * git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  * Put my dotfiles into place:
    * bash install.sh  (destroys .vimrc)
  * Run vim install
    * vim -c 'BundleInstall'
  
    

Tmux
----
I stole so much from  sorin-ionescu/dot-files here.  I changed a few things here.  Like got rid of mouse switching.  Ctrl-L which normally clears the shell screen switches panes which is a minor concession.  Vim navigation all over the place.  It's well documented from sorin.

Irbrc
-----
The main thing I need from this is .local_methods.  Call it on any object and it will tell you what are "interesting methods".  Usually this list is unique enough to jog your memory or use it as a learning tool when using a new gem or API.

Rbenv
-----
I put this minor file just to remind me not to use RVM.  I switched off gemsets in RVM and Rbenv because it was getting weird.  Bundler handles everything but obviously you lose the per-project library seperation.
