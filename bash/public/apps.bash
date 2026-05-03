# shellcheck disable=SC1090
command -v starship &>/dev/null && eval "$(starship init bash)" || echo "starship: binary not found"
command -v fzf &>/dev/null && source <(fzf --bash) || echo "fzf: binary not found"
