## Dotfiles

This configuration attempts to be as minimal as possible, preferring built-in options where viable.

The installations and configurations serve as a minimal foundation to build on. Elixir and Ruby installations are configured to be managed with [kiex], [ruby-install] and [chruby]. Additional software such as PostgreSQL and Docker can be installed using [homebrew].


#### Installation

Execute the following command to initialize the setup:

```
curl https://raw.githubusercontent.com/mrrooijen/dotfiles/master/install | bash
```


#### Details

The following will be installed:

- xcode command-line tools
- [homebrew]
- [emacs]
- [gpg]
- [git]
- [kiex]
- [ruby-install]
- [chruby]
- [spectacle]

The following will be configured:

- bash
- emacs
- git
- kiex
- ruby-install
- chruby
- rubygems


#### License

The contents of this repository are provided under the [MIT License] by [Michael van Rooijen].

[homebrew]: https://brew.sh
[emacs]: https://emacsformacosx.com
[gpg]: https://gnupg.org
[git]: https://git-scm.com
[kiex]: https://github.com/taylor/kiex
[ruby-install]: https://github.com/postmodern/ruby-install
[chruby]: https://github.com/postmodern/chruby
[spectacle]: https://www.spectacleapp.com
[Michael van Rooijen]: https://michael.vanrooijen.io
[MIT License]: https://github.com/mrrooijen/dotfiles/blob/master/LICENSE
