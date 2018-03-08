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

Use [kiex] to manage Elixir versions:

```
brew install erlang
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
```

Use [ruby-install] and [chruby] to manage Ruby versions:

```
brew install ruby-install chruby
```

Available under the [MIT License] by [Michael van Rooijen].

[Homebrew]: https://brew.sh
[ZSH]: https://www.zsh.org
[iTerm2]: https://iterm2.com
[Emacs]: https://emacsformacosx.com
[Docker]: https://www.docker.com/products/docker
[Git]: https://git-scm.com
[Fira Mono for Powerline]: https://github.com/powerline/fonts/tree/master/FiraMono
[kiex]: https://github.com/taylor/kiex
[ruby-install]: https://github.com/postmodern/ruby-install
[chruby]: https://github.com/postmodern/chruby
[Michael van Rooijen]: https://michael.vanrooijen.io
[MIT License]: https://github.com/mrrooijen/dotfiles/blob/master/LICENSE
