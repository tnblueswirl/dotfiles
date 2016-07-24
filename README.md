# Dotfiles

## Overview

This repo contains dotfiles for a simple development environment setup.  It includes a utility ([dfm](https://github.com/justone/dfm)) to help with managing and updating your dotfiles.

## Using this repo

### If you just want to use the dotfiles...

```bash
$ cd ~
$ git clone https://github.com/ahartz1/dotfiles.git .dotfiles
$ ./.dotfiles/bin/dfm install  # creates symlinks to install files
```

### If you want to make changes...

First, fork this repo.

Then, add your dotfiles:

```bash
$ cd ~
$ git clone git@github.com:username/dotfiles.git .dotfiles
$ cd .dotfiles
$  # edit files
$  # edit files
$ git push origin master
```

Finally, to install your dotfiles onto a new system:

```bash
$ cd ~
$ git clone git@github.com:username/dotfiles.git .dotfiles
$ ./.dotfiles/bin/dfm install  # creates symlinks to install files
```

## Full documentation

For more information, check out the [wiki](http://github.com/justone/dotfiles/wiki).

You can also run `dfm --help`.

## Resources for Vim

 * To get Vim running properly, you must have first installed my dotfiles (or at least the Vim-related files) and run `dfm install`.
 * You also must be running vim 7.4.x or greater to allow the `2nd user vimrc` location to be set by default (to `~/.vim/vimrc`). On OS&nbsp;X, this can be done with homebrew: `brew install vim`.
 * For vim-airline to correctly display symbols in the lower status bar, you will need to install a patched font. There are many choices in powerline's [fonts folder](https://github.com/powerline/fonts). However, I prefer Menlo (which is the default font in Atom and isn't in powerline's folder), so I used the patched version [here](https://gist.github.com/qrush/1595572). Navigate to the font in Finder, double click on it, and install it.
 * Once installed, you must change your Terminal or iTerm2 profile font settings to use it.
 * For the solarized theme to work best in iTerm2, download the [iTerm2 color settings](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized) and load them in iTerm2. Note that once it is loaded, you must then select it.
 * Install Vundle, the vim plugin manager:

`$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

 * Then launch Vim and type `:PluginInstall`
 * For syntastic to perform syntax checks on JavaScript, you will need to `$ sudo npm install -g jshint` ([npm](http://npmjs.com))
