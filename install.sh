#!/bin/bash
dir=~/dotfiles
mkdir -p ~/.config/nvim/
if [ "$(uname)" == "Darwin" ]; then
	ln -sf $dir/bashrc ~/.bash_profile
else
	ln -sf $dir/bashrc ~/.bashrc
fi

ln -sf $dir/vimrc ~/.vimrc
ln -sf $dir/init.vim ~/.config/nvim/init.vim
ln -sf $dir/colors ~/.config/nvim/colors
ln -sf $dir/tmux.conf ~/.tmux.conf
