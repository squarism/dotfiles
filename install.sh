#!/bin/env bash

echo "Removing .vimrc..."
rm ~/.vimrc

echo "Symlinking dotfiles into home (including new vimrc)..."
dotfiles=( gemrc irbrc profile rbenv-version tmux.conf vimrc zshenv zshrc )
for dotfile in "${dotfiles[@]}"; do
  cp ~/dotfiles/${dotfile} ~/.${dotfile}
  if [ $? -eq "1" ]; then break; fi
done


echo "Symlinking dotfile directories into home."
dotdirs=( weechat irssi)
for dir in "${dotdirs[@]}"; do
  ln -s ${dir} ~/.${dir}
  if [ $? -eq "1" ]; then break; fi
done

echo
echo "Change your IRC handles in ~/.irssi/config "
echo "Change your IRC handles in ~/.weechat/irc.conf"

echo
echo "Change your Git author info in ~/.zshenv"