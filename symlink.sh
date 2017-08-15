#!/bin/bash
dir=~/dotfiles



if [ "$(uname)" == "Darwin" ]; then
	ln -sf $dir/bashrc ~/.bash_profile
else
	ln -sf $dir/bashrc ~/.bashrc
fi

ln -sf $dir/vimrc ~/.vimrc
ln -sf $dir/tmux.conf ~/.tmux.conf
