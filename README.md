# dotfiles

Base macOS developer configuration.

## Installation

The following command will initiate the installation process:

```
curl -fssl https://raw.githubusercontent.com/mrrooijen/dotfiles/refs/heads/master/install | zsh
```

## Details

The following core software will be installed and/or configured:

- Xcode Command-Line Tools
- Homebrew
- Zsh
- SSH
- Git
- Ghostty
- Emacs
- Mise
- Rectangle

The following language runtimes and compilers will also be installed and globally accessible:

- Ruby
- Python
- Node
- Rust
- Go
- Crystal

Common utilities such as tmux, btop, and packages like cmake and libyaml are also installed.

The `SF Mono` font will be installed for use with tools such as [Emacs] and [Ghostty].

See `install` for more information.

## License

The contents of this repository are provided under the MIT License by [Michael van Rooijen].

[Homebrew]: https://brew.sh
[Mise]: https://github.com/jdx/mise
[Emacs]: https://www.gnu.org/software/emacs/
[Ghostty]: https://ghostty.org
[Michael van Rooijen]: https://github.com/mrrooijen
