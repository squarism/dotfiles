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
  

Tmux
----
I stole so much from  sorin-ionescu/dot-files here.  I changed a few things here.  Like got rid of mouse switching.  Ctrl-L which normally clears the shell screen switches panes which is a minor concession.  Vim navigation all over the place.  It's well documented from sorin.

Irbrc
-----
The main thing I need from this is .local_methods.  Call it on any object and it will tell you what are "interesting methods".  Usually this list is unique enough to jog your memory or use it as a learning tool when using a new gem or API.

Rbenv
-----
I put this minor file just to remind me not to use RVM.  I switched off gemsets in RVM and Rbenv because it was getting weird.  Bundler handles everything but obviously you lose the per-project library seperation.
