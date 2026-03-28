# Source configuration files
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$HOME/.local/bin:$PATH"

HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history"
HISTSIZE=1000
SAVEHIST=1000

for file in "$XDG_CONFIG_HOME/zsh/public/"*.zsh; do
  [ -f "$file" ] && source "$file"
done

if [[ -d "$XDG_CONFIG_HOME/zsh/private" ]]; then
  for file in "$XDG_CONFIG_HOME/zsh/private/"*.zsh; do
    [ -f "$file" ] && source "$file"
  done
fi
