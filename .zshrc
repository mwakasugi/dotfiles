# ________   ______   __    __  _______    ______
# /        | /      \ /  |  /  |/       \  /      \
# $$$$$$$$/ /$$$$$$  |$$ |  $$ |$$$$$$$  |/$$$$$$  |
#    /$$/  $$ \__$$/ $$ |__$$ |$$ |__$$ |$$ |  $$/
#   /$$/   $$      \ $$    $$ |$$    $$< $$ |
#  /$$/     $$$$$$  |$$$$$$$$ |$$$$$$$  |$$ |   __
# /$$/____ /  \__$$ |$$ |  $$ |$$ |  $$ |$$ \__/  |
# /$$      |$$    $$/ $$ |  $$ |$$ |  $$ |$$    $$/
# $$$$$$$$/  $$$$$$/  $$/   $$/ $$/   $$/  $$$$$$/

autoload -U compinit; compinit
autoload -U colors; colors

local zsh_dir="${HOME}/.zsh"

source ${zsh_dir}/options.zsh
source ${zsh_dir}/load-functions.zsh
source ${zsh_dir}/themes/itchy.theme.zsh

bindkey -d
bindkey -e

# -------------------------------------
# 履歴
# -------------------------------------
# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 履歴を複数端末間で共有する。
setopt share_history
# 重複するコマンドが記憶されるとき、古い方を削除する。
setopt hist_ignore_all_dups
# 直前のコマンドと同じ場合履歴に追加しない。
setopt hist_ignore_dups
# 重複するコマンドが保存されるとき、古い方を削除する。
setopt hist_save_no_dups
# コマンド履歴呼び出し
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
