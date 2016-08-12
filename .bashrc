HISTFILE=${HOME}/.bash_history
HISTSIZE=50000
HISTFILESIZE=50000

## Prompt Configuration
export PS1="\[\e[0;36m\]\u@\h:\w\$\[\e[00m\] "

## Pager Configuration
if type lv > /dev/null 2>&1; then
  export PAGER='lv'
else
  export PAGER='less'
fi

export LV='-c -l'
export LESS='-gj10Rr'

## Alias Configuration
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
  freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
  linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

if type colordiff > /dev/null 2>&1; then
  alias diff="colordiff"
fi

## Path Configuration

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## Share history
function share_history {
  history -a
  history -c
  history -r
}

PROMPT_COMMAND='share_history'
