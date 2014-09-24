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

RVM
-----
The rvmrc file included will create gemsets on use.  My workflow looks like this:

  * Create a file named .versions.conf in the root of the project.  The file
    will look this:

        ruby=default
        ruby-gemset=project_name

  * You can also use rvmrc formatted files if you wish but the community is
    trying to standardize on one format that will work for rbenv & rvm &
    others.  Just make sure to use your default ruby instead of specifying the
    ruby version name.  Otherwise, when you upgrade ruby all your projects will
    be using an older ruby version and you might get an error.  Use default by
    default and then override it if you need to.

I also included a CFLAGS example in ~/.rvmrc that can be tweaked so that native C extension
gems might get a speed boost.

    rvm_configure_env=(CFLAGS="-march=nocona -O2 -pipe")
    # look up your CPU at gentoo
    # http://en.gentoo-wiki.com/wiki/Safe_Cflags/Intel

