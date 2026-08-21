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
- `prompt` - Git-aware prompt (`dir:branch $`)
- `mise` - Toolchain manager activation

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

Keep commit messages concise and to the point — straight, conforming to best practices, never a wall of text.

**Format:** `[Category] Imperative subject`

- Prefix every commit with a bracketed category (see below).
- Imperative mood ("Add", "Fix", "Update", "Drop", "Switch", "Use", "Remove"), capitalize the first word, no trailing period.
- One line, roughly 50–72 chars. Fold the _why_ into the subject when it's short, e.g. `[Emacs] Use override keymap for § bindings to prevent mode shadowing`.

**Categories** (chosen by the area changed):

- `[Emacs]` — `emacs/` config and modules
- `[Shell]` — `zsh/` (zshrc, zprofile, zshenv) and `ghostty/` terminal config (older commits used `[Zsh]`)
- `[Installer]` — the `install` script
- `[Git]` — `git/gitconfig`
- `[README]` — README
- `[General]` — repo-wide or meta changes (`.gitignore`, tooling)

When a change spans areas, join categories with `/`, e.g. `[Shell/Emacs]`, `[Installer/Zsh]`. For sweeping cross-cutting changes, use `[All]`.

**Bodies are the exception, not the rule.** Most commits are a subject line only. Add a body only when it captures non-obvious context the subject can't — the _why_ behind a fix or a subtle technical detail — wrapped to a few short lines. If the subject already says it, stop there.
