# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

fcd() {
  local dir
  dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf +m) && cd "$dir"
}

function lk {
  cd "$(walk "$@")"
}

killit() {
  if [ $# -ne 1 ]; then
    echo "Usage: port <port_number>"
    return 1
  fi

  local port_number="$1"
  local process_info

  process_info=$(lsof -i :$port_number | grep LISTEN)

  if [ -z "$process_info" ]; then
    echo "No process found listening on port $port_number"
    return 1
  fi

  local pid
  pid=$(echo "$process_info" | awk '{print $2}')

  echo "Process using port $port_number:"
  echo "$process_info"

  read -q "confirm?Do you want to kill the process using this port? (y/n): "

  if [[ "$confirm" == "y" ]]; then
    kill -9 "$pid"
    echo "Process with PID $pid has been killed."
  else
    echo "Process with PID $pid was not killed."
  fi
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo web-search zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/opt/homebrew/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export JAVA_HOME=$(/usr/libexec/java_home)
export PNPM_HOME="/Users/oscar/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export BAT_THEME="TwoDark"
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias sublime="open -a /Applications/Sublime\ Text.app"
alias code="open -a Visual\ Studio\ Code.app"
alias ls="exa -la --git --group-directories-first"
alias lsd="exa -laD --git"
alias lst="exa -T --group-directories-first -I=\".git|.history|node_modules\""
alias lstd="exa -DT -I=\".git|.history|node_modules\""
alias rmf="rm -rf"
alias g="git"
alias y="yarn"
alias n="npm"
alias d="docker"
alias dc="docker-compose"
alias cat="bat --paging=never"
alias python="python3"
alias pip="python -m pip"
alias ip="curl icanhazip.com"
alias spot="ncspot"
alias tm="tmux"
alias tms="tmux new -s"
alias tma="tmux attach -t"
alias tmr="tmux rename-session -t"
alias v="nvim"
alias z="zellij"
alias za="zellij attach"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/material.omp.json)"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zellij setup --generate-auto-start zsh)"

eval "$(atuin init zsh)"
