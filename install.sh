#!/bin/bash
# Set current directory, only run from ~/dotfiles
dir=~/dotfiles

# Create neovim config folder if not exists
mkdir -p ~/.config/nvim

# Install base16-shell if not already installed (source from .bashrc)
if [ ! -d ~/.config/base16-shell ]; then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi


# Symlink MacOS .bash_profile
if [ "$(uname)" == "Darwin" ]; then
    ln -sf $dir/bashrc ~/.bash_profile
fi

# Always symlink .bashrc
ln -sf $dir/bashrc ~/.bashrc

ln -sf $dir/nvimrc ~/.config/nvim/init.vim
ln -sf $dir/ycm_extra_conf.py ~/.config/nvim/.ycm_extra_conf.py
ln -sf $dir/tmux.conf ~/.tmux.conf
