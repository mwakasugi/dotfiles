# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/hirofumiwakasugi/.config/omf"

set fish_greeting ""

set -g Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set fish_plugins theme peco rbenv z thefuck

# set fish_theme fishface

function peco_select_repository
  set peco_flags --layout=bottom-up
  ghq list -p | peco --layout=bottom-up | read line

  if [ $line ]
    commandline $line
  else
    commandline ''
  end
end

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

alias ghl peco_select_repository

# Git aliases
alias ga 'git add'
alias gst 'git status'
alias gb 'git branch'
alias gco 'git checkout'
alias gc 'git commit'
alias gd 'git diff'
alias gdt 'git difftool'
alias gp 'git push'
alias gp 'git push'
alias gclean 'git clean -fd'
alias gl 'git pull'
