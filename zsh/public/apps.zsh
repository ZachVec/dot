# shellcheck disable=SC1090
command -v starship &>/dev/null && eval "$(starship init zsh)" || echo "starship: binary not found"
command -v fzf &>/dev/null && source <(fzf --zsh) || echo "fzf: binary not found"
