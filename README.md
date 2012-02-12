Dotfiles
========

This is my dotfiles collection for ZSH, VIM and miscellaneous utilities/configurations.


Install
-------

First, ensure Oh My ZSH (OMZSH) is installed by running:

```
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

Next, ensure that you have VIM installed, preferably with the `--rubyinterp` flag. Using the Homebrew package manager on OSX, you can do this by running:

```
brew install https://raw.github.com/adamv/homebrew-alt/master/duplicates/vim.rb
```

Finally, clone this repository to a safe location on your hard disk, and run the `install` script.

```
git clone git://github.com/meskyanichi/dotfiles.git
cd dotfiles && git submodule init && git submodule update --recursive && ./install
```

This should set up the symlinks from the dotfiles directory to your `$HOME` directory, do not remove the dotfiles directory. If you later decide to move the dotfiles directory to a different location, simply move it to the desired location and run the `install` script again.


Arch Linux
----------

You'll need to install zsh through pacman on Arch Linux. You may do this before or after installing OMZSH.

```
sudo pacman -Sy zsh
```

*Note that you might need to run the above command two or more times depending on how old your current distribution is. Confirm that zsh has been installed by running `which zsh`. If it returns `/bin/zsh` it's been successfully installed.*

Once installed, set `zsh` as the default shell.

```
chsh -s $(which zsh)
```

Now, restart the shell (log out/in, close/open, etc) and run `echo $SHELL` to confirm whether it's running `zsh` or not.

