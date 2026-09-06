# AGENTS.md

This file provides guidance to AI agents working in this repository.

## Repository Overview

Personal macOS dotfiles for Michael van Rooijen. Manages configuration for Zsh, Emacs, Git, Ghostty terminal, and Rectangle window manager. Uses Mise for language runtime management (Ruby, Node, Python, Rust, Go, Crystal).

## Installation

```bash
# Full setup (installs Homebrew, tools, and symlinks configs)
curl -fssl https://raw.githubusercontent.com/mrrooijen/dotfiles/refs/heads/master/install | zsh

# Or run locally
./install
```

The install script is idempotent - it checks for existing installations before proceeding.

## Architecture

### Directory Structure

- `zsh/` - Shell configuration with modular includes (options, variables, prompt, mise)
- `emacs/` - Highly modular Emacs config with 44 separate modules
- `git/` - Git config with 1Password SSH commit signing
- `ghostty/` - Ghostty terminal config (Gruvbox theme, SF Mono font)
- `rectangle/` - Rectangle window manager keybindings

### Emacs Configuration

Uses `straight.el` for package management (not package.el). Entry point is `emacs/init.el` which loads modules from `emacs/modules/`.

**Key modules:**

- `evil.el` - Vim emulation
- `helm.el` - Completion and navigation
- `projectile.el` - Project management
- `gptel.el` - LLM interface via OpenRouter
- Language modes: `ruby.el`, `rust.el`, `typescript.el`, `web.el`, etc.

**Keybinding system:** Uses General.el with `§` (section sign) as leader key. See `emacs/modules/keybindings.el` for bindings.

### Zsh Configuration

`zsh/zshrc` sources modular files from `zsh/include_zshrc/`:

- `options` - Shell behavior, completion, history
- `variables` - PATH, EDITOR (emacsclient)
- `aliases` - `g`/`tg`/`c`/`tc`/`cursor`/`s` → grok, tmpgrok, cursor-agent, tmpcursor, seatbelt
- `prompt` - Git-aware prompt (`dir:branch $`)
- `mise` - Toolchain manager activation
- `seatbelt` - Source aifiles `seatbelt()` when present
- `mic_mode` - Hold a named mic open for Control Center Mic Mode
- `tmpagent` - `tmpgrok` / `tmpcursor`: mktemp -d, cd, run grok or cursor-agent
- `local` - Machine-local overrides (optional)

Login shell config in `zsh/zprofile` sources `zsh/include_zprofile/` for Homebrew setup.

### Credential Management

All secrets (API keys, SSH signing) are managed through 1Password:

- Git commits signed via `op-ssh-sign`
- OpenRouter API key: `op://Final Creation/OpenRouter/emacs-key`

## Symlink Locations

The install script creates these symlinks:

- `~/.zshrc` → `zsh/zshrc`
- `~/.zprofile` → `zsh/zprofile`
- `~/.gitconfig` → `git/gitconfig`
- `~/Library/Application Support/com.mitchellh.ghostty/config` → `ghostty/config`
- `~/.emacs.d/init.el` → `emacs/init.el`
- `~/.emacs.d/early-init.el` → `emacs/early-init.el`

## Git Commit Messages

**Format:** `[Tag] Imperative subject`

Always a bracketed tag, then an imperative verb (Add, Fix, Update, Drop, Switch, Use, Remove, Lock, Set), capitalized, no trailing period. One line, ~50–72 chars (tagged-era median ~43; do not exceed 72). Fold the why into the subject when it fits.

```
[Emacs] Use override keymap for § bindings to prevent mode shadowing
[Shell] Add tmpgrok/tmpcursor and g/tg/c/tc aliases
[Installer] Harden with set -euo pipefail and brew shellenv on PATH
```

**Tags** — pick by the files changed. Do not invent new ones.

| Tag           | Use for                                          |
| ------------- | ------------------------------------------------ |
| `[Emacs]`     | `emacs/`                                         |
| `[Shell]`     | `zsh/`, `ghostty/`                               |
| `[Installer]` | `install`                                        |
| `[Git]`       | `git/`                                           |
| `[README]`    | README                                           |
| `[General]`   | meta: `.gitignore`, AGENTS.md-only, `rectangle/` |
| `[All]`       | sweeping cross-cutting                           |

Span areas with `/` (`[Shell/Emacs]`, `[Installer/Zsh]`). Smallest set; do not enumerate every area.

Do not revive retired tags: `[Zsh]` / `[ZSH]` / `[Bash]` → `[Shell]`; `[Ssh]` → `[Git]` or `[Shell]`; `[GPG]` / `[Gemrc]` — gone with those configs.

**Bodies** are the exception. Subject-only unless the why is not in the title, then a few short lines.

**Corpus (follow this, not old outliers):** 567 commits, 2012–. Bracket tags from 2018 (`[Emacs]` ~2/3 of tagged). `[Shell]` replaced `[Zsh]`/`[Bash]` (last `[Zsh]` 2022). No periods on titles from 2021. Pre-2018 is untagged and often past tense ("Added…") — ignore it. Eight 2026 subjects dropped the tag (agent lapse); do not copy those. Merge commits are GitHub defaults, not a style.
