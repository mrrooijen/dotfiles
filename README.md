# Dotfiles

These dotfiles contain configuration and installation for:

* XCode
* Homebrew
* ZSH
* VIM, MacVim
* chruby
* Misc. Utilities

**This setup is intended for Mac OSX - Mountain Lion.**

## Installation

Here is a step-by-step installation.

### XCode

Install XCode through the Mac App Store. Once done, open it, agree to the license. Now, go to `XCode > Preferences > Downloads` and download the `Command Line Tools`.

### Homebrew

Next, install [Homebrew](http://mxcl.github.com/homebrew/) using the following command.

    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

After installing Homebrew, ensure permissions are correct by running the following.

    sudo chown -R $(whoami) /usr/local
    brew update

### VIM

Mac OSX comes installed with an old version of VIM. Replace this installation with a recent version of VIM through Homebrew.

    brew install --with-features=huge --enable-interp=lua,ruby,perl,python \
      https://raw.github.com/telemachus/homebrew/vim-mine/Library/Formula/vim.rb

### MacVIM

Next, install MacVIM as well.

    brew install macvim

### Git

Get the latest version of Git.

    brew install git

### ZSH

Install ZSH with the following command.

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

### All Environment, ZSH, VIM, and MacVIM Configuration

Next, clone this Git repository to your $HOME directory and initialize/update the submodules and finally hook everything up by running the `install` script.

    git clone git://github.com/meskyanichi/dotfiles.git $HOME/dotfiles
    cd $HOME/dotfiles && git submodule init && git submodule update --recursive && ./install

This should set up the symlinks from the dotfiles directory to your `$HOME` directory, do not remove the `dotfiles` directory.

### RubyBuild (Ruby Installer) and chruby (Ruby Version Switcher)

Next we'll install some packages that various Ruby versions depends on.

    brew install openssl readline libyaml

Now install the `apple-gcc42` compiler to be able to install versions of Ruby that are older than `1.9.3`.

    brew tap homebrew/dupes
    brew install apple-gcc42

Another dependency is [XQuartz](http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg). Download and install this. It is required in order to install Ruby 1.8.7. You *might* need to reboot after installing this.

Next install `ruby-build` so we can start installing Ruby implementations and versions on our machine.

    brew install ruby-build

### Ruby Implementations and Versions

Finally, using ruby-build, we'll install a few Ruby implementations and versions.

**Ruby 2.0.0**

    ruby-build 2.0.0-p195 ~/.rubies/ruby-2.0.0-p195

**Ruby 1.9.3**

    CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl` ruby-build 1.9.3-p327 ~/.rubies/ruby-1.9.3-p327

**Ruby 1.8.7**

    CPPFLAGS=-I/opt/X11/include CC=/usr/local/bin/gcc-4.2 ruby-build 1.8.7-p370 ~/.rubies/ruby-1.8.7-p370

**Rubinius** (without Ruby Build so we can install it in `--1.9` mode)

    git clone https://github.com/rubinius/rubinius.git ~/Desktop/rubinius
    cd ~/Desktop/rubinius
    ./configure --prefix=~/.rubies/rbx --enable-version=1.8,1.9 --default-version=1.9
    rake install

**JRuby**

    ruby-build jruby-1.7.0-rc2 ~/.rubies/jruby-1.7.0-rc2

### Switching between Ruby versions

Simply install `chruby` using homebrew:

    brew install https://raw.github.com/postmodern/chruby/master/homebrew/chruby.rb

Then add the following to your `~/.bashrc` or `~/.zshrc`:

    # Load chruby to manage all ruby versions
    source /usr/local/share/chruby/chruby.sh
    RUBIES=(~/.rubies/*)

Load chruby and point the `RUBIES` environment variable to `~/.rubies/*` since that's where we install all the various ruby implementations and versions.

Now you can switch by simply running the following command.

    chruby rbx
    # or: chruby jruby
    # or: chruby ruby-2.0.0
    # or: chruby ruby-1.9.3
    # or: chruby ruby-1.8.7

To see a list of available Rubies run the following command.

    chruby

If you want to use the system Ruby, simply run the following command.

    chruby system

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

