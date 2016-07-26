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

set fish_plugins theme peco rbenv z thefuck balias

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

balias ghl peco_select_repository

# Git aliases
balias ga 'git add'
balias gst 'git status'
balias gb 'git branch'
balias gco 'git checkout'
balias gc 'git commit'
balias gd 'git diff'
balias gdca 'git diff --cached'
balias gdt 'git difftool'
balias gp 'git push'
balias gclean 'git clean -fd'
balias gl 'git pull'

# direnv
eval (direnv hook fish)

