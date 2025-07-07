# ---------------------- oh-my-zsh ----------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker zsh-vi-mode)

HISTFILE="${ZSH}/cache/.zsh_history"
ZSH_COMPDUMP="${ZSH}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# --------------------- cpp -----------------------
source /opt/rh/gcc-toolset-14/enable
ulimit -c unlimited

# --------------------- zsh -----------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# --------------------- general -------------------
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LS_COLORS=${LS_COLORS}:'di=01;35'

#------------------- fuzzy-shell -------------------
source "${HOME}/.fuzzy_shell/scripts/export.sh"
alias "fs"="fuzzy --search"
alias "fj"="fuzzy --jump"
alias "fe"="fuzzy --edit"
alias "hh"="fuzzy --history"

#-------------------- starship ---------------------
eval "$(starship init zsh)"

#---------------------- conda -----------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/root/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/root/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#---------------------- nvm -----------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#----------------------- bin -----------------------
export PATH="$PATH:/data/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

#---------------------- tdsql -----------------------
source "/data/workspace/tdsql-dev-utils/script/export.sh"

#-------------------- alias --------------------
alias "nv"="nvim"
alias "tm"="tmux"
alias "ll"="ls -l"
alias "la"="ls -al"
alias "lg"="lazygit"
alias "td.source"="source /data/workspace/tdsql-dev-utils/script/export.sh"
alias "td.sql"="mysql --comments --host 127.0.0.1 -u root -ptdsql2.5 --port "
alias "td.cli"="mycli --host 127.0.0.1 -u root -ptdsql2.5 --port"
alias "view"="nvim -R"
alias "tca"="tmux capture-pane -S - && tmux save-buffer ~/.tmux-log/$(date +"%Y%m%d-%H:%M").tmux.log"

# -------------------- ccache --------------------
#ccache
export USE_CCACHE=1
export CCACHE_SLOPPINESS=file_macro,include_file_mtime,time_macros
export CCACHE_UMASK=002
export CCACHE_DIR="/data/.ccache"
export CC="ccache gcc"
export CXX="ccache g++"
