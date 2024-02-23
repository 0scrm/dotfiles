. "$HOME/.cargo/env"
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home)
export PNPM_HOME="/Users/oscar/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export BAT_THEME="Catppuccin-mocha"
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export "MICRO_TRUECOLOR=1"

export ANDROID_HOME="/Users/oscar.marion/Library/Android/sdk"
export ANDROID_SDK_ROOT="/Users/oscar.marion/Library/Android/sdk"
export GRADLE_USER_HOME="/usr/local/share/gradle"
export M2_HOME="/usr/local/share/maven"
export LANG="en_US.UTF-8"
. $(brew --prefix asdf)/libexec/asdf.sh

# Add Flow virtual environment to PATH
export PATH="/Users/oscar.marion/.flow/venv/bin:$PATH"
# export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(direnv hook $SHELL)"
export PATH="${PATH}:/Users/oscar.marion/.asdf/installs/python/3.9.10/bin"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="${PATH}:$VOLTA_HOME/bin"
export PATH="${PATH}:/Users/oscar.marion/.yarn/bin"
eval "$(grond completion)"
export JAVA_HOME="`/usr/libexec/java_home -v AndroidStudioJre`"
export PATH="${PATH}:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH=$PATH:$HOME/.maestro/bin
export DIRENV_LOG_FORMAT=