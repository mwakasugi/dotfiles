#!/usr/bin/env bash

cd $HOME
# ln -s .ghq/github.com/5t111111/dotfiles/.zsh
# ln -s .ghq/github.com/5t111111/dotfiles/.zshrc
# ln -s .ghq/github.com/5t111111/dotfiles/.zshlib
# ln -s .ghq/github.com/5t111111/dotfiles/.zshenv
# ln -s .ghq/github.com/5t111111/dotfiles/.zprofile
# ln -s .ghq/github.com/5t111111/dotfiles/.vimrc
# ln -s .ghq/github.com/5t111111/dotfiles/.gvimrc
# ln -s .ghq/github.com/5t111111/dotfiles/.vim
# ln -s .ghq/github.com/5t111111/dotfiles/.emacs.d
ln -s .ghq/github.com/5t111111/dotfiles/.gemrc
ln -s .ghq/github.com/5t111111/dotfiles/.gitconfig
ln -s .ghq/github.com/5t111111/dotfiles/.gitignore_global
ln -s .ghq/github.com/5t111111/dotfiles/.pryrc
ln -s .ghq/github.com/5t111111/dotfiles/.tigrc
# ln -s .ghq/github.com/5t111111/dotfiles/.rubocop.yml
# ln -s .ghq/github.com/5t111111/dotfiles/.scss-lint.yml
ln -s .ghq/github.com/5t111111/dotfiles/.tmux.conf
ln -s .ghq/github.com/5t111111/dotfiles/.atom
# ln -s .ghq/github.com/5t111111/dotfiles/.spacemacs
# ln -s .ghq/github.com/5t111111/dotfiles/.jruby_art

# XDG_CONFIG
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

# Fish
# ln -s ~/.ghq/github.com/5t111111/dotfiles/fish ${XDG_CONFIG_HOME}/fish

# Powerline
ln -s ~/.ghq/github.com/5t111111/dotfiles/powerline ${XDG_CONFIG_HOME}/powerline

# neovim
# ln -s ~/.vim $XDG_CONFIG_HOME/nvim
# ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
