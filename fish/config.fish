# Basic configuration
# ------------------------------------------------------------------------------
# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/hirofumiwakasugi/.config/omf"

# Global variables
# ------------------------------------------------------------------------------
set -g fish_prompt_pwd_dir_length 3
set -g fish_greeting ""
set -g Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

# Initialize oh-my-fish
# ------------------------------------------------------------------------------
# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set fish_plugins theme peco rbenv z thefuck balias direnv

# Aliases
# ------------------------------------------------------------------------------
# functions
balias pk peco_kill_process
balias f peco_find

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
