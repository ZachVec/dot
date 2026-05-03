# shellcheck disable=SC1090,SC1091
shopt -s nullglob

# Bootstrap: source shared env (hardcoded path — XDG_CONFIG_HOME not set yet)
for file in "$HOME/.config/sh/public/"*.sh; do
  [ -f "$file" ] && source "$file"
done

# Source shared private env vars
if [[ -d "$XDG_CONFIG_HOME/sh/private" ]]; then
  for file in "$XDG_CONFIG_HOME/sh/private/"*.sh; do
    [ -f "$file" ] && source "$file"
  done
fi

# Chain to .bashrc for interactive login shells
[[ -f ~/.bashrc ]] && source ~/.bashrc
