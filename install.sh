#!/bin/env bash

if [ -f ~/.vimrc ]; then
	echo "Removing .vimrc..."
	rm ~/.vimrc
fi

echo "Copying dotfiles into home (including new vimrc)..."
dotfiles=( gemrc profile rvmrc tmux.conf vimrc zshenv gitconfig )
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
