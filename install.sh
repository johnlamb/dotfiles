#!/bin/bash
# Set current directory, only run from ~/dotfiles
dir=~/dotfiles

# Install base16-shell if not already installed (source from .bashrc)
test -d "~/.config/base16-shell" && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Create neovim config folder if not exists
test -d "~/.config/nvim" && mkdir -p ~/.config/nvim/

# Symlink MacOS .bash_profile
if [ "$(uname)" == "Darwin" ]; then
	ln -sf $dir/bashrc ~/.bash_profile
fi

# Always symlink .bashrc
ln -sf $dir/bashrc ~/.bashrc

ln -sf $dir/vimrc ~/.vimrc
ln -sf $dir/nvimrc ~/.config/nvim/init.vim
ln -sf $dir/tmux.conf ~/.tmux.conf
