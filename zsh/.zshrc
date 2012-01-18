# General (OM)ZSH Environment Variables
ZSH="$HOME/.oh-my-zsh"  # Path to my OMZSH installation
ZSH_DIR="$HOME/.zsh"    # Path to my custom ZSH directory
ZSH_THEME="sorin"       # ZSH Theme ( from: ~/.oh-my-zsh/themes )

# General (OM)ZSH Configuration
source "$ZSH_DIR/config"

# Load OMZSH Plugins
plugins=(git github heroku osx rails3 rake ruby rvm brew bundler cap gem)

# Load OMZSH Core
source $ZSH/oh-my-zsh.sh

# Aliases
source $ZSH_DIR/aliases

# Set the definite PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Load Ruby Version Manager
if [[ -s ~/.rvm/scripts/rvm ]]; then source ~/.rvm/scripts/rvm; fi
