# cargo
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# NVM
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

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
