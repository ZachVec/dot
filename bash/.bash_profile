# shellcheck disable=SC1090,SC1091
shopt -s nullglob

# XDG base directories — must be set before sourcing sh/public/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Source shared profile configs (exports, env vars)
for file in "$XDG_CONFIG_HOME/sh/public/profile/"*.sh; do
  [ -f "$file" ] && source "$file"
done
for file in "$XDG_CONFIG_HOME/sh/private/profile/"*.sh; do
  [ -f "$file" ] && source "$file"
done

# Chain to .bashrc for interactive login shells
[[ -f ~/.bashrc ]] && source ~/.bashrc
