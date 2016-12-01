# dot
conf files
```
git clone https://github.com/n3wtn9/dot.git ~/.dot
ln -s ~/.dot/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
# iTerm
Use iTerm with tmux integration over ssh
```
ssh user@localhost -t 'tmux -CC attach -t 0'
```

# VIM
YouCompleteMe plugin has to be compiled.

# Powerline
For vim-airline to work properly install the powerline fonts. In iTerm switch
the font.
