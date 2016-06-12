#! /bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -rs ./vimrc ~/.vimrc
ln -rs ./tmux.conf.linux ~/.tmux.conf
vim +PluginInstall +qall
