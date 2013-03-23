#!/bin/env bash

echo "Removing .vimrc..."
rm ~/.vimrc

echo "Copying dotfiles into home (including new vimrc)..."
dotfiles=( gemrc irbrc profile rvmrc tmux.conf vimrc zshenv zshrc )
for dotfile in "${dotfiles[@]}"; do
  cp ~/dotfiles/${dotfile} ~/.${dotfile}
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
