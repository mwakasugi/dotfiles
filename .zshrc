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

# Pre-load configurations
() {
  local zsh_dir="${HOME}/.zsh"

  source ${zsh_dir}/options.zsh
  source ${zsh_dir}/themes/super-itchy.zsh-theme
  source ${zsh_dir}/load-completions.zsh
  source ${zsh_dir}/load-functions.zsh
  source ${zsh_dir}/load-aliases.zsh
  source ${zsh_dir}/load-widgets.zsh
  source ${zsh_dir}/key-bindings.zsh
  source ${zsh_dir}/zplug.zsh
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
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' verbose yes

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -Uz select-word-style
select-word-style bash

eval "$(direnv hook zsh)"

eval "$(thefuck --alias)"
export PATH="/usr/local/sbin:$PATH"

# Workaround https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
