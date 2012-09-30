# from ryan.mcgeary.org
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# ruby-build plugin for rbenvand etc
if [ -d "$HOME/local/bin" ] ; then
  PATH="$HOME/local/bin:$PATH"
fi

# i don't like shared history between shells
unsetopt SHARE_HISTORY

# virtualenv stuff
PATH=${PATH}:/usr/local/share/python

# Before other PATHs...
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
  source /usr/local/share/python/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi
