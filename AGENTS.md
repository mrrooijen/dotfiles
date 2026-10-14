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
- `herdr/` - Herdr config (terminal multiplexer for coding agents). See Herdr Keybindings.
- `shinra/` - The launch agent that keeps the shared folder of Shinra, the agent's server, mounted. See Shinra Drive.
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
- `aliases` - `g`/`tg`/`c`/`tc`/`cc`/`tcc`/`cursor`/`s` → grok, tmpgrok, cursor-agent, tmpcursor, claude, tmpclaude, seatbelt
- `prompt` - Git-aware prompt (`dir:branch $`)
- `mise` - Toolchain manager activation
- `seatbelt` - Source aifiles `seatbelt()` when present
- `mic_mode` - Hold a named mic open for Control Center Mic Mode
- `tmpagent` - `tmpgrok` / `tmpcursor` / `tmpclaude`: mktemp -d, cd, run grok, cursor-agent, or claude
- `keyring` - `keyring_env VAR id`: failsafe OS keyring → env (call only from `~/.zshrc.local`)
- `local` - Sources `~/.zshrc.local` (machine-local; not git)

Login shell config in `zsh/zprofile` sources `zsh/include_zprofile/` for Homebrew setup.

### Herdr Keybindings

`herdr/config.toml` is Herdr's generated default config with the `[keys]` below set. Herdr takes one key after the prefix (`ctrl+b`), so a letter names the thing and a modifier names the action. After an edit, run `herdr server reload-config`, which reports an invalid binding.

| Thing     | New        | Rename           | Close          | Cycle   |
| --------- | ---------- | ---------------- | -------------- | ------- |
| Workspace | `prefix+w` | `prefix+shift+w` | `prefix+alt+w` | `alt+1` |
| Tab       | `prefix+t` | `prefix+shift+t` | `prefix+alt+t` | `alt+2` |
| Pane      | `prefix+p` | `prefix+shift+p` | `prefix+alt+p` | `alt+3` |
| Agent     |            |                  |                | `alt+§` |

A new pane is a split to the right. `alt+/` opens the Goto picker, which searches agents and terminals. `cmd+k` clears the pane. `prefix+space` opens the workspace picker. `alt` is the Option key, which Ghostty must send as Alt.

### Shinra Drive

Shinra, the agent's server, whose machine name in the tailnet is `shinra`, shares its `~/drive` folder through Tailscale (Taildrive), and this computer mounts it at `~/shinra/drive`. macOS drops that mount at a restart, so a launch agent mounts it again.

- `shinra/mount-drive` mounts the folder when it is not mounted and the server answers. It looks the tailnet's name up, and it writes to `~/Library/Logs/shinra-drive.log` when it mounts the folder or fails to.
- `shinra/mount-drive.plist` is the launch agent `io.vanrooijen.shinra-drive`, which runs the script at login and every minute. `install` copies it to `~/Library/LaunchAgents/` and loads it, so run those lines of `install` again after a change to it. `install` also removes the launch agent of the earlier server, which was named `herdr`.

`launchctl print gui/$(id -u)/io.vanrooijen.shinra-drive` shows the last run. macOS refuses a second mount of the same share, so do not mount it at another folder as well.

`install` also sets `DSDontWriteNetworkStores`, so Finder writes no `.DS_Store` files into the shared folder or any other network folder. Finder reads the setting when it starts.

### Supply-Chain Guards

The guards of the package managers (a 7-day cooldown, and no install scripts where a tool can refuse them) are not in this repository. The `dependencies` skill of aifiles holds them as templates, and writes each missing file in the home directory before an agent works with a package manager, on this computer as on the agent's server. `install` removes the links to the files that served as the guards before.

`install` keeps two guards of its own: mise's `minimum_release_age`, set by `mise settings` before `mise use -g`, and osv-scanner through mise, which audits lockfiles for known vulnerabilities.

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
- `~/.config/herdr/config.toml` → `herdr/config.toml`
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

| Tag           | Use for                                                              |
| ------------- | -------------------------------------------------------------------- |
| `[Emacs]`     | `emacs/`                                                             |
| `[Shell]`     | `zsh/`, `ghostty/`, `herdr/`                                         |
| `[Installer]` | `install`                                                            |
| `[Git]`       | `git/`                                                               |
| `[README]`    | README                                                               |
| `[General]`   | meta: `.gitignore`, `.prettierrc.json`, AGENTS.md-only, `rectangle/` |
| `[All]`       | sweeping cross-cutting                                               |

Span areas with `/` (`[Shell/Emacs]`, `[Installer/Zsh]`). Smallest set; do not enumerate every area.

Do not revive retired tags: `[Zsh]` / `[ZSH]` / `[Bash]` → `[Shell]`; `[Ssh]` → `[Git]` or `[Shell]`; `[GPG]` / `[Gemrc]` — gone with those configs.

**Bodies** are the exception. Subject-only unless the why is not in the title, then a few short lines.

**Corpus (follow this, not old outliers):** 567 commits, 2012–. Bracket tags from 2018 (`[Emacs]` ~2/3 of tagged). `[Shell]` replaced `[Zsh]`/`[Bash]` (last `[Zsh]` 2022). No periods on titles from 2021. Pre-2018 is untagged and often past tense ("Added…") — ignore it. Eight 2026 subjects dropped the tag (agent lapse); do not copy those. Merge commits are GitHub defaults, not a style.
