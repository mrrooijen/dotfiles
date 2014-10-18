# Dotfiles

These dotfiles contain configuration and installation for:

* XCode
* Homebrew
* ZSH
* VIM, MacVIM
* ruby-install, chruby
* Misc. Utilities

**This setup is intended for Mac OSX - Mavericks.**

## Installation

Here is a step-by-step installation guide.

### XCode

Install XCode through the Mac App Store. Once done, install the command-line tools using the command-line:

    xcode-select --install

### Homebrew

Next, install [Homebrew](http://mxcl.github.com/homebrew/) using the following command:

    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

### Git

Get the latest version of Git:

    brew install git

### VIM, MacVIM

Next install VIM and MacVIM:

    brew install mercurial vim macvim

*Note: Mercurial is a dependency of the `vim` package.*

### ZSH

Install ZSH with the following command:

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

### All Environment, ZSH, VIM, and MacVIM Configuration

Next, clone this Git repository to your $HOME directory and finally hook everything up by running the `install` script:

    git clone git@github.com:meskyanichi/dotfiles.git $HOME/dotfiles
    cd $HOME/dotfiles && ./install

This should set up the symlinks from the dotfiles directory to your `$HOME` directory, and install VIM plugins. Do not remove the `dotfiles` directory.

### ruby-install (Ruby Installer) and chruby (Ruby Version Switcher)

Install `ruby-install` so we can start installing Ruby implementations and versions on to our machine:

    brew install ruby-install

Now you can easily install Ruby implementations and versions, like so:

**Ruby**

    ruby-install ruby stable

**Rubinius**

    ruby-install rubinius stable

**JRuby**

    ruby-install jruby stable

Ruby implementations and version are installed in `~/.rubies/`. Run `ruby-install` to see a list of available implementations and versions.

### Switching between Ruby versions

Install `chruby` to enable easy switching of Ruby versions:

    brew install chruby

Now you can switch by simply running the following commands:

    chruby ruby
    chruby rubinius
    chruby jruby

Run `chruby` to see a list of installed Rubies.

Run `chruby system` to switch back to system Ruby.

### Misc. Utilities

**Node.js platform.**

    brew install node

**CoffeeScript language.**

    npm install coffee-script

**Here are some misc. utilities.**

    brew install ack tree ffmpeg imagemagick htop-osx watch

**Some datastores.**

    brew install postgresql mongodb redis mysql memcached

**Awesome game console emulator for playing many retro games.**

    brew tap homebrew/games
    brew install mednafen

