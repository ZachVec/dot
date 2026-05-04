# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Dotfiles repo cloned to `~/.config`. Config files live here, symlinked from `~/`. Example:
```
~/.bashrc → ~/.config/bash/bashrc.bash
```

## `.gitignore` is deny-by-default

The first line is `*` — only whitelisted paths are tracked. To add a new directory, add a `!dirname/` block to `.gitignore`. Private dirs use a nested pattern: `!dirname/` and `!dirname/**/*` at the top level, then `dirname/private/**/*` to exclude secrets, with `!dirname/private/.gitkeep` to keep the empty directory itself.

## Shell architecture

```
bash/    — bash-specific init files
zsh/     — zsh-specific init files
sh/      — shared across both shells
  public/
    profile/   — exports, env vars (sourced by .bash_profile / .zshenv)
    rc/        — aliases, functions, init (sourced by .bashrc / .zshrc)
  private/
    profile/   — secret exports (gitignored)
    rc/        — secret interactive scripts (gitignored)
```

- **profile** files run once at login. Child shells inherit the exports via process tree.
- **rc** files run in every interactive shell (aliases, functions, nvm/starship/fzf init).
- Adding a `.sh` file to the right directory is enough — all init files use wildcard globs.
- `bash/bashrc.bash` guards against running without `.bash_profile` first: if `XDG_CONFIG_HOME` is unset, it prints an error and returns.

## `nvim` submodule

Neovim config is a separate repo tracked as a git submodule. Run `git submodule update --init` after clone.

## Code style

- `# shellcheck disable=SC1090,SC1091` throughout for dynamic source paths that shellcheck can't resolve.
- `shopt -s nullglob` in all bash init files so empty directories don't produce literal `*.sh` strings.
