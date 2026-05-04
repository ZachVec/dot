#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

info()  { echo -e "${GREEN}==>${NC} $*"; }
warn()  { echo -e "${RED}WARN:${NC} $*" >&2; }

# ── detect OS ──────────────────────────────────────────────
case "$(uname -s)" in
    Darwin) OS="mac"  ;;
    Linux)  OS="linux" ;;
    *)
        echo "Unsupported OS: $(uname -s)" >&2
        exit 1
        ;;
esac
info "Detected OS: $OS"

# ── choose shell ───────────────────────────────────────────
echo ""
echo "Which shell to configure?"
echo "  1) bash"
echo "  2) zsh"
read -r -p "Choice [1/2]: " choice

case "$choice" in
    1) shell="bash" ;;
    2) shell="zsh"  ;;
    *) echo "Invalid choice" >&2; exit 1 ;;
esac

CONFIG_DIR="$HOME/.config"

# ── backup helper ──────────────────────────────────────────
backup() {
    local target="$1"
    if [[ -e "$target" || -L "$target" ]]; then
        local backup
        backup="${target}.bak.$(date +%s)"
        mv "$target" "$backup"
        warn "Backed up $target → $backup"
    fi
}

# ── create symlinks ────────────────────────────────────────
info "Setting up $shell ..."

if [[ "$shell" == "bash" ]]; then
    backup "$HOME/.bash_profile"
    backup "$HOME/.bashrc"
    ln -sf "$CONFIG_DIR/bash/.bash_profile" "$HOME/.bash_profile"
    ln -sf "$CONFIG_DIR/bash/bashrc.bash"   "$HOME/.bashrc"
    info "Created ~/.bash_profile → $CONFIG_DIR/bash/.bash_profile"
    info "Created ~/.bashrc        → $CONFIG_DIR/bash/bashrc.bash"
elif [[ "$shell" == "zsh" ]]; then
    backup "$HOME/.zshenv"
    ln -sf "$CONFIG_DIR/zsh/.zshenv" "$HOME/.zshenv"
    info "Created ~/.zshenv → $CONFIG_DIR/zsh/.zshenv"
    info "ZDOTDIR will be set by .zshenv, no ~/.zshrc symlink needed"
fi

# ── init submodules ────────────────────────────────────────
if git -C "$CONFIG_DIR" rev-parse --git-dir >/dev/null 2>&1; then
    info "Initializing git submodules ..."
    git -C "$CONFIG_DIR" submodule update --init
fi

echo ""
info "Done. Open a new terminal to apply."
