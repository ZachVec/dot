# shellcheck disable=SC1090,SC1091
shopt -s nullglob

if [[ -z "$XDG_CONFIG_HOME" ]]; then
  echo "bashrc: XDG_CONFIG_HOME is not set — ensure .bash_profile runs first" >&2
  return 1
fi
export PATH="$HOME/.local/bin:$PATH"
export HISTFILE="$XDG_STATE_HOME/bash/history"

# Source shared interactive configs (aliases, functions, init)
for file in "$XDG_CONFIG_HOME/sh/public/rc/"*.sh; do
  [ -f "$file" ] && source "$file"
done
for file in "$XDG_CONFIG_HOME/sh/private/rc/"*.sh; do
  [ -f "$file" ] && source "$file"
done

# Source bash-specific public configs
for file in "$XDG_CONFIG_HOME/bash/public/"*.bash; do
  [ -f "$file" ] && source "$file"
done

# Source bash-specific private configs
if [[ -d "$XDG_CONFIG_HOME/bash/private" ]]; then
  for file in "$XDG_CONFIG_HOME/bash/private/"*.bash; do
    [ -f "$file" ] && source "$file"
  done
fi
