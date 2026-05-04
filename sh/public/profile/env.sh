# shellcheck disable=SC1091

# Redirect dotfile histories to XDG paths
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/repl_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite/history"
export WGET_HSTS="$XDG_CACHE_HOME/wget-hsts"

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# cargo
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# NVM
export NVM_DIR="$XDG_DATA_HOME/nvm"

# homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# uv
export UV_DEFAULT_INDEX="http://mirrors.aliyun.com/pypi/simple/"

# agents
export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
# export ANTHROPIC_MODEL=deepseek-v4-pro[1m]
# export ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-v4-pro[1m]
# export ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-v4-pro[1m]
# export ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-v4-flash
# export CLAUDE_CODE_SUBAGENT_MODEL=deepseek-v4-flash
# export CLAUDE_CODE_EFFORT_LEVEL=max
export OPENAI_BASE_URL="https://dashscope.aliyuncs.com/compatible-mode/v1"
export OPENAI_MODEL="qwen3-coder-plus"
