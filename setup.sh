#!/usr/bin/env bash
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: NONE

which nvim &> /dev/null || sudo dnf install -y neovim python3-neovim

ln -fsrv bashrc ~/.bashrc
ln -fsrv bash_profile ~/.bash_profile
ln -fsrv gdbinit ~/.gdbinit
ln -fsrv git ~/.config/git

[[ ! -e ~/.config/Code/User ]] && mkdir -p ~/.config/Code/User
ln -fsrv Code/User/settings.json ~/.config/Code/User/settings.json

ln -fsrv nvim ~/.config/nvim
ln -fsrv nvim ~/.vim
ln -fsrv nvim/init.vim ~/.vimrc

[[ ! -e ~/.config/pulse ]] && mkdir -p ~/.config/pulse
ln -fsrv pulse/daemon.conf ~/.config/pulse/daemon.conf

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.local/share/vim/{backup,plugins,swap}
mkdir -p ~/.local/share/nvim/{backup,plugins}

nvim +PlugInstall +qa
nvim +UpdateRemotePlugins +qa
