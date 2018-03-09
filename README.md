## Dotfiles

Configuration for my development environment.


#### Installation

Execute the following command for automatic setup:

```
curl https://raw.githubusercontent.com/mrrooijen/dotfiles/master/install | bash
```


#### Contents

The following will be installed:

- XCode Command Line Tools
- [Homebrew]
- [Emacs]
- [Git]

The following will be configured:

- Bash
- Emacs
- Git
- RubyGems


#### Additional Notes

Use [Homebrew] to install additional packages:

```
brew install <package>
```

Use [kiex] to manage Elixir versions:

```
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
```

Use [ruby-install] and [chruby] to manage Ruby versions:

```
brew install ruby-install chruby
```

The contents of this repository are provided under the [MIT License] by [Michael van Rooijen].

[Homebrew]: https://brew.sh
[Emacs]: https://emacsformacosx.com
[Git]: https://git-scm.com
[kiex]: https://github.com/taylor/kiex
[ruby-install]: https://github.com/postmodern/ruby-install
[chruby]: https://github.com/postmodern/chruby
[Michael van Rooijen]: https://michael.vanrooijen.io
[MIT License]: https://github.com/mrrooijen/dotfiles/blob/master/LICENSE
