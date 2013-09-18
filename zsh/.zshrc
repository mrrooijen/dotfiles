# General (OM)ZSH Environment Variables
ZSH="$HOME/.oh-my-zsh"  # Path to my OMZSH installation
ZSH_DIR="$HOME/.zsh"    # Path to my custom ZSH directory
ZSH_THEME="sorin"       # ZSH Theme ( from: $HOME/.oh-my-zsh/themes )

# General (OM)ZSH Configuration
source "$ZSH_DIR/omzsh_config"

# Load OMZSH Plugins
plugins=(git github heroku osx rails3 rake ruby brew bundler cap gem)

# Load OMZSH Core
source "$ZSH/oh-my-zsh.sh"

# Aliases
source "$ZSH_DIR/aliases"

# Config
source "$ZSH_DIR/config"

# Load Local Aliases
if [[ -f "$HOME/dotfiles-local/zsh/.zsh/aliases" ]]; then source "$HOME/dotfiles-local/zsh/.zsh/aliases"; fi

# Base paths
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Node Packager Manager bin path
export PATH="/usr/local/share/npm/bin:$PATH"

# Heroku Toolbelt path
export PATH="/usr/local/heroku/bin:$PATH"

# Load chruby to manage all ruby versions
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
RUBIES=(~/.rubies/*)

# Set $GOPATH and add Go executables to $PATH.
export GOPATH=$HOME/Developer/Go
export PATH=$PATH:$GOPATH/bin

