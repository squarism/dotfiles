#!/bin/bash

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

if [ -d ~/.vimbundles ]; then
  mv ~/.vimbundles ~/vimbundles.squarism-dotfiles.bak
fi
mkdir ~/.vimbundles

olddir=`pwd`
cd ~/.vimbundles
for a in `cat ${olddir}/vim/plugins.list`; do
  git clone "https://${a}"
done
cd ${olddir}


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
