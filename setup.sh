#!/bin/sh

cd $HOME
ln -s Laboratory/dotfiles/.zshrc
ln -s Laboratory/dotfiles/.zshlib
ln -s Laboratory/dotfiles/.zshenv
ln -s Laboratory/dotfiles/.vimrc
ln -s Laboratory/dotfiles/.gvimrc
ln -s Laboratory/dotfiles/.vim
ln -s Laboratory/dotfiles/.emacs.d
ln -s Laboratory/dotfiles/.gemrc
ln -s Laboratory/dotfiles/.gitignore_global
ln -s Laboratory/dotfiles/.pryrc
ln -s Laboratory/dotfiles/.tigrc
ln -s Laboratory/dotfiles/.rubocop.yml
ln -s Laboratory/dotfiles/.tmux.conf
ln -s Laboratory/dotfiles/.atom
ln -s Laboratory/dotfiles/.spacemacs

# neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
