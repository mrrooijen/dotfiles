---
applyTo: '**/*.el'
---
# Emacs Preferences for mrrooijen

## Philosophy
- **Simplicity and Clarity:** Favor direct, explicit code and configuration over abstraction layers and macros.
- **Transparency:** Prefer vanilla Emacs functions (`define-key`, `add-hook`, `global-set-key`, etc.) for keybindings and hooks to ensure full understanding and control.
- **Stability & Reproducibility:** Avoid unnecessary packages and abstractions that could introduce fragility, confusion, or API changes.
- **Debuggability & Portability:** Value configs that are easy to troubleshoot and work across any Emacs installation.
- **Idiomatic Emacs Lisp:** Always write idiomatic Emacs Lisp code. Favor standard conventions and patterns familiar to experienced Emacs users and Elisp developers, avoiding nonstandard or obscure constructs.

## File Header Convention
- **Every Emacs Lisp file MUST begin with:**  
  ```
  ;; -*- lexical-binding: t; -*-
  ```
  This enforces lexical binding and ensures consistent, modern behavior across all configuration files.

## Package Management
- **Use `straight.el` exclusively for package management:**
  - Install, remove, freeze, and thaw packages for reliable, reproducible setups.
  - Lockfile support (`straight-freeze-versions`/`straight-thaw-versions`) for “Gemfile”-like consistency across environments.
  - Prefer direct use of `straight.el` functions without additional abstraction layers.
- **Avoid `use-package`:**
  - Do not use `use-package` for configuration, hooks, or package loading.
  - Rely on plain Emacs Lisp for package setup to maximize clarity and minimize indirection.

## Package Configuration & Loading

- **Do not defer package loading unless there is a good, explicit reason.**
  - If a package is essential to your editing environment or always needed (e.g., `company-mode` for completion), enable it directly after installation rather than deferring with hooks like `after-init-hook`.
  - Only use deferred loading (such as via `add-hook 'after-init-hook`, or other delayed mechanisms) if you have a specific need, such as resolving load-order issues, reducing startup time, or avoiding conflicts.
  - In most cases, enabling a package (e.g., `(global-company-mode)`) as part of the direct init process is preferred for clarity and predictability.

- **Prefer lazy configuration, not lazy loading:**
  - Use `with-eval-after-load` to configure packages only after they are loaded, ensuring the relevant keymaps, functions, and variables are available.
  - Example:
    ```elisp
    (with-eval-after-load 'parinfer
      (define-key parinfer-mode-map (kbd "<tab>") #'parinfer-smart-tab:dwim-right))
    ```
  - This approach avoids errors from referencing undefined symbols and keeps configuration clean and robust.

- **Do not explicitly `(require 'package)` immediately after using `straight-use-package`**, unless it is strictly necessary for proper functioning (such as for essential packages like Evil that are foundational to your setup).
  - In general, rely on autoloads and lazy configuration so packages are only loaded when needed.
  - Only use `(require 'package)` if the package must be available globally and immediately (for example, Evil, which should be loaded early for modal editing and keymap setup).

## Keybindings

### General Principle
- **Prefer `define-key` for keybindings.**
  - `define-key` is direct, explicit, and universally applicable to all Emacs keymaps, including Evil state maps and major mode maps.
  - Using `define-key` ensures every keybinding is easily searchable, explicit, and avoids unnecessary abstraction.
  - This approach aligns with the philosophy of clarity, maintainability, and full control over configuration.

### Evil Integration
- Use Evil for modal (Vim-like) editing, and configure Evil directly in Emacs Lisp.
- For global Evil state bindings (e.g., all buffers in normal state), use `define-key` with the relevant Evil state keymap (e.g., `evil-normal-state-map`).
- For keybindings that should apply only in a specific major mode (e.g., `ruby-mode`), use `define-key` with the major mode's keymap (e.g., `ruby-mode-map`).

### When to Use `evil-define-key`
- **Only use `evil-define-key` when you need to target a keybinding at both:**
  - A specific Evil state **and**
  - A specific major mode
- This avoids the need for verbose hooks or buffer-local keymap manipulation.
- Do **not** use `evil-define-key` for global bindings, where `define-key` is sufficient.

### Rationale
- This approach is intended to maximize clarity, maintainability, and explicitness.
- It avoids unnecessary layers of abstraction and repetition, except in the rare case where per-state, per-mode bindings would otherwise require verbose hook logic.
- `evil-define-key` is reserved for those cases where it meaningfully reduces complexity without obscuring behavior.
- Otherwise, `define-key` is preferred as the most transparent and direct method.

### Additional Guidelines
- **Do not use local variable bindings like `(let ((map keymap)) ...)` just to reduce verbosity**—explicitly write out the keymap for each binding to maximize clarity and ensure all mappings are easily searchable.
- Avoid external keybinding packages (such as `general.el`) unless strictly necessary.

## Hooks & Configuration
- **Vanilla Hooks:** Use `add-hook` for mode setup and customization, rather than macro-based alternatives or use-package keywords.
- **Minimal Dependencies:** Only add packages when they provide clear, indispensable value.

## Organization
- **Split configuration into logical files:**  
  - Organize your config by splitting `init.el` into a series of `(load ...)` operations.
  - Typically, each package or mode has its own file (e.g., `evil.el`, `ruby.el`, `elisp.el`, `helm.el`, `treemacs.el`, etc.).
  - All configuration is placed in its corresponding file, so everything is clearly organized without use-package or other macro-based grouping.
  - **Non-mode and non-package files:**  
    - Include files such as `options.el` for general Emacs options and generic/system-level keybindings (e.g., restart Emacs, kill emails, switch buffer).
    - Use these files to store settings and mappings that pertain to Emacs as a system, not tied to any particular mode or package.
  - This approach ensures maintainability and transparency, as it is always clear what belongs to which package, mode, or system-level configuration.

## Essential Tooling Loading Order
- **Intentionally load essential tooling (such as Evil and the leader-map) as early as possible in `init.el`**:
  - This ensures all subsequent configuration files can safely reference and use these tools and keymaps without needing to check for their existence.
  - **Do not perform safety checks** such as `(when (boundp 'evil-insert-state-minor-mode-map) ...)` or `(when (featurep 'evil) ...)` or similar for the leader-map, Evil, or other core infrastructure. Their availability is guaranteed by the early loading order.
  - This approach reduces unnecessary verbosity and keeps the configuration clean, direct, and maintainable.

## General Approach
- **Verbose over Abstraction:** Accept a bit more verbosity for the sake of explicitness, clarity, and maintainability.
- **Understand Every Line:** Want to know, in detail, what each part of the config is doing.
- **Avoid Black Magic:** Steer clear of “magic” macros or layers that obscure underlying behavior, unless absolutely necessary.
- **Idiomatic Emacs Lisp:** Always aim for idiomatic Emacs Lisp code and design, using standard patterns and best practices recognized in the Emacs community.

---

## Moving Forward
- Focus on vanilla Emacs solutions for configuration, keybindings, hooks, and organization.
- Use external packages and abstractions only when they offer clear, concrete advantages that cannot be achieved reasonably with vanilla Emacs.
- Rely on `straight.el` for package management and reproducible, frozen environments.
- Use Evil for modal editing, configuring it directly for clarity and control.
- Leader key bindings should consistently use `§` as the prefix.
- Configuration should be organized in separate files for each package or mode, loaded explicitly from `init.el`.
- Include additional files for general options and system-level mappings (e.g., `options.el`) for base/global settings.
- Do not use variable bindings (e.g., `let ((map keymap)) ...`) just for the sake of reducing verbosity in keymap configuration—prefer explicitness and searchability.
- Use `evil-define-key` only when targeting keys to both a specific Evil state and a specific major mode, otherwise prefer `define-key`.
- Prefer lazy configuration with `with-eval-after-load` for package configuration, and avoid explicit `require` unless necessary for the functioning of your setup.
- **Always write idiomatic Emacs Lisp code and configuration.**
- **Do not defer loading of packages (e.g., via hooks) unless there is a clear, explicit reason. If a package is always needed, load it directly.**
