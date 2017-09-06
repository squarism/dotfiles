#!/bin/bash
function spacer() {
  echo -e "\n\n-------------------------------------------------\n\n"
}

# Sanity tests
# --------------------------------------------------------------
if [ -d ./vim ] && [ -f ./squarism.zsh-theme ]; then
  echo "Starting dotfile install ..."
  sleep 1
else
  echo "Please run the install from the git clone'd directory"
  exit 1
fi

if [ ! -x $(which git) ]; then
  echo Please install git.
  exit 1
fi


# Vim config
# --------------------------------------------------------------
if [ -f ~/.vimrc ]; then
  echo "Backing up .vimrc to vimrc.squarism-dotfiles.bak"
  mv ~/.vimrc ~/vimrc.squarism.bak
fi

cp vim/vimrc ~/.vimrc
cp vim/vimrc.local ~/.vimrc.local

if [ -d ~/.vim/bundle ]; then
  mv ~/.vim/bundle ~/vimbundle.squarism-dotfiles.bak
fi
mkdir -p ~/.vim/bundle

olddir=`pwd`
cd ~/.vim/bundle
for a in `cat ${olddir}/vim/plugins.list`; do
  git clone -q "https://${a}"
done
cd ${olddir}

if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
fi
ln -s ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

# create temp file locations, these are used by vimrc.local
if [ ! -d ~/.vim/swap ]; then; mkdir -p ~/.vim/swap; fi
if [ ! -d ~/.vim/tmp ]; then; mkdir -p ~/.vim/tmp; fi

echo "All done with the vim config."
spacer

# General config
# --------------------------------------------------------------

echo "Copying dotfiles into home (including new vimrc)..."
dotfiles=( gemrc profile rvmrc tmux.conf zshenv gitconfig )
for dotfile in "${dotfiles[@]}"; do
  cp ${dotfile} ~/.${dotfile}
  if [ $? -eq "1" ]; then break; fi
done


echo "Symlinking dotfile directories into home."
dotdirs=( weechat irssi )
for dir in "${dotdirs[@]}"; do
  ln -s ${dir} ~/.${dir}
  if [ $? -eq "1" ]; then break; fi
done


echo "Copying over a custom zsh theme called squarism."
cp squarism.zsh-theme ~/.oh-my-zsh/themes/
if [ "$?" -eq "0" ]; then
  echo "make sure oh-my-zsh is installed."
fi

echo
echo "Change your IRC handles in ~/.irssi/config "
echo "Change your IRC handles in ~/.weechat/irc.conf"

echo
echo "Change your Git author info in ~/.zshenv"
echo "Also take a look at .zshenv for all customizations ..."

echo
echo "Install base16 for 256 shell colors"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
if [ $? -eq "0"]; then
  echo "Success.  Running color test.  There should not be any dark blue patterns at the end."
  echo "Check https://github.com/chriskempson/base16-shell for options if not."
  ~/.config/base16-shell/colortest
else
  echo "Couldn't git clone.  Do you have git installed?  Internet down?"
  exit 1
fi


# os specific hooks
###################
platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='mac'
fi

if [[ $platform == 'linux' ]]; then
  cp zshrc.linux ~/.zshrc
fi

if [[ $platform == 'mac' ]]; then
  cp zshrc.mac ~/.zshrc
fi
