# shellcheck disable=SC1090,SC1091

HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history"
HISTSIZE=1000
SAVEHIST=1000

# Source shared interactive configs (aliases, functions, init)
for file in "$XDG_CONFIG_HOME/sh/public/rc/"*.sh(N); do
  [ -f "$file" ] && source "$file"
done
for file in "$XDG_CONFIG_HOME/sh/private/rc/"*.sh(N); do
  [ -f "$file" ] && source "$file"
done

# Source zsh-specific configs
for file in "$XDG_CONFIG_HOME/zsh/public/"*.zsh(N); do
  [ -f "$file" ] && source "$file"
done
if [[ -d "$XDG_CONFIG_HOME/zsh/private" ]]; then
  for file in "$XDG_CONFIG_HOME/zsh/private/"*.zsh(N); do
    [ -f "$file" ] && source "$file"
  done
fi
