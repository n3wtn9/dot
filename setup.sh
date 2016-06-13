#! /bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

ln -rs ./vimrc ~/.vimrc
ln -rs ./tmux.conf.linux ~/.tmux.conf
vim +PluginInstall +qall
