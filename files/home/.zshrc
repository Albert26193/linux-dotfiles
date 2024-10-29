# ---------------------- oh-my-zsh ----------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker zsh-vi-mode)

HISTFILE="${ZSH}/cache/.zsh_history"
ZSH_COMPDUMP="${ZSH}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# --------------------- zsh -----------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# --------------------- general -------------------
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LS_COLORS=${LS_COLORS}:'di=01;35'

#  --------------------- alias --------------------
alias "nv"="nvim"
alias "tm"="tmux"
alias "ll"="ls -l"
alias "la"="ls -al"

#------------------- fuzzy-shell -------------------
source "${HOME}/.fuzzy_shell/scripts/export.sh"
alias "fs"="fuzzy --search"
alias "fj"="fuzzy --jump"
alias "fe"="fuzzy --edit"
alias "hh"="fuzzy --history"

