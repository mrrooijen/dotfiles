## Dotfiles

My development environment for Mac OSX (Yosemite). 

**Core Components:**

- Homebrew 
- Vim, MacVim
- ZSH
- Git

**Sub Components:**

- ruby-install
- chruby

**Programming Languages:**

- Ruby
- Elixir
- Rust
- Go

**Databases:**

- PostgreSQL
- Redis

**Common Utilities:**

- ack
- tree
- watch
- htop-osx
- imagemagick
- ffmpeg


### Installation

Quick guide to setup the development environment.


#### XCode (required)

Install XCode using the Mac App Store, then run:

    xcode-select --install


#### Developer Tools

The following will install the latest versions of homebrew, git, vim, macvim, zsh, ruby-install, chruby, and their configuration via this dotfiles repository's install script.

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update && brew install git vim macvim zsh ruby-install chruby
    git clone --recursive git@github.com:meskyanichi/dotfiles.git $HOME/dotfiles
    cd $HOME/dotfiles && ./install

The install script will also do the following:

- Symlink vim, zsh, ack, git, and gem configurations from the dotfiles path.
- Ensure `$HOME/Developer/{Ruby,Elixir,Rust,Go}` workspaces are available.
- Install all Vundle plugins.


#### iTerm

Download [ITerm2](http://iterm2.com). 

##### Colors

- Preset: [base16-default.dark](https://github.com/chriskempson/base16-iterm2)

##### Text 

- Cursor: Vertical Bar
- Regular Font: "18pt Meslo LG S DZ Regular for Powerline"
- Non-ASCII Font: "17pt Meslo LG S Regular for Powerline"


#### Programming Languages

The following installs Ruby, Elixir, Rust, and Go.

    ruby-install ruby 2.2.0
    brew install elixir
    brew install rust
    brew install go


#### Databases

The following installs PostgreSQL and Redis.

    brew install postgresql
    brew install redis


#### Common Utilities

The following installs a few useful utilities.

    brew install ack 
    brew install tree 
    brew install watch 
    brew install htop-osx 
    brew install imagemagick 
    brew install ffmpeg 


#### Octodown

The following installs `octodown` which is useful for previewing markdown files.

    brew install icu4c cmake pkg-config
    gem install octodown
