# ________   ______   __    __  _______    ______
# /        | /      \ /  |  /  |/       \  /      \
# $$$$$$$$/ /$$$$$$  |$$ |  $$ |$$$$$$$  |/$$$$$$  |
#    /$$/  $$ \__$$/ $$ |__$$ |$$ |__$$ |$$ |  $$/
#   /$$/   $$      \ $$    $$ |$$    $$< $$ |
#  /$$/     $$$$$$  |$$$$$$$$ |$$$$$$$  |$$ |   __
# /$$/____ /  \__$$ |$$ |  $$ |$$ |  $$ |$$ \__/  |
# /$$      |$$    $$/ $$ |  $$ |$$ |  $$ |$$    $$/
# $$$$$$$$/  $$$$$$/  $$/   $$/ $$/   $$/  $$$$$$/

bindkey -d
bindkey -e

autoload -U compinit; compinit
autoload -U colors; colors

() {
  local zsh_dir="${HOME}/.zsh"

  source ${zsh_dir}/options.zsh
  source ${zsh_dir}/themes/super-itchy.zsh
  source ${zsh_dir}/load-functions.zsh
  source ${zsh_dir}/load-widgets.zsh
  source ${zsh_dir}/key-bindings.zsh
}


# 以下未整理だけどとりあえず設定しとかないとやってられないやつ

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

case "${OSTYPE}" in
darwin*)
  export LSCOLORS=exfxcxdxbxegedabagacad
  alias ls="ls -Gh"
  alias ll="ls -lGhA"
  ;;
linux*)
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  alias ls='ls -h --color'
  alias ll='ls -lhA --color'
  ;;
esac

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gclean='git clean -fd'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdt='git difftool'
alias gf='git fetch'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gp='git push'
alias gr='git rebase'
alias gri='git rebase -i'
alias grim='git rebase -i origin/master'
alias gst='git status'

# zplug
export ZPLUG_HOME="${HOME}/.zsh/.zplug"
source ${ZPLUG_HOME}/init.zsh

() {
  # if type pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
  # fi
}


eval "$(direnv hook zsh)"

eval "$(thefuck --alias)"
export PATH="/usr/local/sbin:$PATH"

# Go
export GOPATH=${HOME}/.go
export PATH=${PATH}:${GOPATH}/bin
