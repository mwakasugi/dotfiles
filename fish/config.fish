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
set -gx EDITOR vim

# Initialize oh-my-fish
# ------------------------------------------------------------------------------
# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set fish_plugins theme peco rbenv z thefuck balias direnv

# Aliases
# ------------------------------------------------------------------------------
# Basic
balias lla 'ls -la'

# functions
balias pk peco_kill_process
balias f peco_find
balias gbco peco_git_checkout

# Git aliases
balias ga 'git add'
balias gb 'git branch'
balias gc 'git commit'
balias gclean 'git clean -fd'
balias gco 'git checkout'
balias gcob 'git checkout -b'
balias gd 'git diff'
balias gdca 'git diff --cached'
balias gdt 'git difftool'
balias gf 'git fetch'
balias gl 'git pull'
balias glog 'git log --oneline --decorate --graph'
balias gp 'git push'
balias gr 'git rebase'
balias gri 'git rebase -i'
balias grim 'git rebase -i origin/master'
balias gst 'git status'

# Language specific configuration
# ------------------------------------------------------------------------------

# Go
set -x GOPATH $HOME/.go
set -x PATH /usr/local/opt/go/libexec/bin $PATH
set -x PATH $GOPATH/bin $PATH
