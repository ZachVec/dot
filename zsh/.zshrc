HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history"
HISTSIZE=1000
SAVEHIST=1000

for file in "$XDG_CONFIG_HOME/zsh/public/"*.zsh(N); do
  [ -f "$file" ] && source "$file"
done

if [[ -d "$XDG_CONFIG_HOME/zsh/private" ]]; then
  for file in "$XDG_CONFIG_HOME/zsh/private/"*.zsh(N); do
    [ -f "$file" ] && source "$file"
  done
fi
