#!/bin/bash

# In order for NERDTree to recognize the plugin, it has to be in its
# nerdtree_plugin folder. But we want the script under source control!
# Solution? Symlink it in if it doesn't already exist.
if [ -d ~/.dotfiles/.vim/bundle/nerdtree/nerdtree_plugin ] && \
   [ -e ~/.dotfiles/myscripts/yank_path.vim ] && \
   [ ! -e ~/.dotfiles/.vim/bundle/nerdtree/nerdtree_plugin/yank_path.vim ]
then
  ln -s ~/.dotfiles/myscripts/yank_path.vim \
        ~/.dotfiles/.vim/bundle/nerdtree/nerdtree_plugin/yank_path.vim
fi
