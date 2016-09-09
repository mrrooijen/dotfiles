## Dotfiles - MacOS Development Environment

Install by running:

    curl https://raw.githubusercontent.com/mrrooijen/dotfiles/master/install | bash

The following will be installed:

- XCode command-line tools (`xcode-select --install`)
- [Homebrew]
- [ZSH]
- [iTerm2]
- [Emacs]
- [Docker]
- [Git]
- [Fira Mono for Powerline]

The following will be set up and configured:

- ZSH (prompt, aliases, variables, functions, etc)
- Emacs (config, spacemacs, make default `$EDITOR`/`$GIT_EDITOR`)
- Git (gitconfig)
- RubyGems (gemrc)

Notes:

- [chruby] config automatically available when chruby is installed (`brew install chruby ruby-install`)

Available under the [MIT License] by [Michael van Rooijen].

[Homebrew]: http://brew.sh
[ZSH]: http://www.zsh.org
[iTerm2]: http://iterm2.com
[Emacs]: https://emacsformacosx.com
[Docker]: https://www.docker.com/products/docker
[Git]: https://git-scm.com
[Fira Mono for Powerline]: https://github.com/powerline/fonts/tree/master/FiraMono
[chruby]: https://github.com/postmodern/chruby
[Michael van Rooijen]: http://michael.vanrooijen.io
[MIT License]: https://github.com/mrrooijen/dotfiles/blob/master/LICENSE
