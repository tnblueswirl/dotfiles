# Dotfiles

## Overview

This repo contains dotfiles for a simple development environment setup.  It includes a utility ([dfm](https://github.com/justone/dfm)) to help with managing and updating your dotfiles.

## Using this repo

### If you just want to use the dotfiles...

```bash
$ git clone https://github.com/tiyd-python-2015-08/dotfiles.git
$ ./dotfiles/bin/dfm install # creates symlinks to install files
```

### If you want to make changes...

First, fork this repo.

Then, add your dotfiles:

```bash
$ git clone git@github.com:username/dotfiles.git dotfiles
$ cd dotfiles
$  # edit files
$  # edit files
$ git push origin master
```

Finally, to install your dotfiles onto a new system:

```bash
$ cd $HOME
$ git clone git@github.com:username/dotfiles.git dotfiles
$ ./dotfiles/bin/dfm install # creates symlinks to install files
```

## Full documentation

For more information, check out the [wiki](http://github.com/justone/dotfiles/wiki).

You can also run `dfm --help`.
