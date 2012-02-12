Dotfiles
========

These are my dotfiles.

These dotfiles contain configuration and installation for:

* ZSH + OhMyZSH (OMZSH)
* VIM
* Gem
* Misc. bin files


Prerequisites
-------------

### Mac OSX

Mac OSX comes with an old version of VIM installed, and it also hasn't been compiled with the appropriate flags, like `--enable-rubyinterp`.
Use [Homebrew](http://mxcl.github.com/homebrew/) to install a newer version of VIM with proper build flags.

```
brew install https://raw.github.com/adamv/homebrew-alt/master/duplicates/vim.rb
```

### Arch Linux

You'll need to install `zsh` through `pacman` on Arch Linux.

```
sudo pacman -Sy zsh
```

*Note that depending on how old your distribution is, you may have to re-run the above command two or more times.
Confirm that `zsh` has been installed by running `which zsh`.*

Once installed, set `zsh` as the default shell.

```
chsh -s $(which zsh)
```

Now, restart the shell (log out/in, close/open, etc) and run `echo $SHELL` to confirm whether it's running `zsh` or not.


Install
-------

First, install Oh My ZSH (OMZSH).

```
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

Then clone this repository to a good location (e.g. `$HOME`) and install it.

```
git clone git://github.com/meskyanichi/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles && git submodule init && git submodule update --recursive && ./install
```

This should set up the symlinks from the dotfiles directory to your `$HOME` directory, do not remove the `dotfiles` directory.
If you later decide to move the `dotfiles` directory to a different location, simply move it to the desired location and run the `dotfiles/install` script again.

