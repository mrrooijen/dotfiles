## Dotfiles - MacOS Development Environment

Install by running:

    curl https://raw.githubusercontent.com/mrrooijen/dotfiles/master/install | bash

The following will be installed:

- XCode command-line tools (`xcode-select --install`)
- [Homebrew]
- [ZSH]
- [Emacs]
- [Git]

The following will be set up and configured:

- ZSH (prompt, aliases, variables, functions, etc)
- Emacs (config, spacemacs, make default `$EDITOR`/`$GIT_EDITOR`)
- Git (gitconfig)
- RubyGems (gemrc)

Notes:

- [chruby] config automatically available when chruby is installed (`brew install chruby ruby-install`)

Available under the [MIT License] by [Michael van Rooijen].

[Homebrew]: http://brew.sh
[ZSH]: http://zsh.sourceforge.net
[Emacs]: https://www.gnu.org/software/emacs/
[Git]: https://git-scm.com
[chruby]: https://github.com/postmodern/chruby
[Michael van Rooijen]: http://michael.vanrooijen.io
[MIT License]: https://github.com/mrrooijen/dotfiles/blob/master/LICENSE
