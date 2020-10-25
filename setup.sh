#!/usr/bin/env bash

which nvim &> /dev/null || sudo dnf install -y neovim python3-neovim

ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig

[[ ! -e ~/.config/Code/User ]] && mkdir -p ~/.config/Code/User
ln -sf ~/.dotfiles/Code/User/settings.json ~/.config/Code/User/settings.json

ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/nvim ~/.vim
ln -sf ~/.dotfiles/nvim/init.vim ~/.vimrc

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.local/share/vim/{backup,plugins,swap}
mkdir -p ~/.local/share/nvim/{backup,plugins}

nvim +PlugInstall +qa
nvim +UpdateRemotePlugins +qa