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
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups

alias ll='ls -la'

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

() {
  if type pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
  fi
}


eval "$(direnv hook zsh)"

eval "$(thefuck --alias)"
export PATH="/usr/local/sbin:$PATH"
