alias ll='ls -lah';
alias tf='terraform';
alias kube='kubectl';

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# PATH=$(pyenv root)/shims:$PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# add pipenv to path
PYTHON_BIN_PATH="$(python -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"

# Force Docker use amd64
# export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Multiple Homebrews on Apple Silicon

arch=$(uname -m)

if [ "$(arch)" = "arm64" ]; then

eval "$(/opt/homebrew/bin/brew shellenv)"

else

eval "$(/usr/local/bin/brew shellenv)"

fi%
