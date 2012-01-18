Dotfiles
========

This is my dotfiles collection for ZSH, VIM and miscellaneous utilities/configurations.


Install
-------

First, ensure Oh My ZSH (OMZSH) is install by running:

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
cd dotfiles && ./install
```

This should set up the symlinks from the dotfiles directory to your `$HOME` directory, so do not remove the dotfiles directory.