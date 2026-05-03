# Bootstrap: source shared env (hardcoded path — XDG_CONFIG_HOME not set yet)
for file in "$HOME/.config/sh/public/"*.sh; do
  [ -f "$file" ] && source "$file"
done

# Source shared private env vars
if [[ -d "$XDG_CONFIG_HOME/sh/private" ]]; then
  for file in "$XDG_CONFIG_HOME/sh/private/"*.sh(N); do
    [ -f "$file" ] && source "$file"
  done
fi

# Tell zsh to look for .zshrc / .zprofile / .zlogin here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
