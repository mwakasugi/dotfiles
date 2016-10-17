# ==============================================================================
# Initialize zplug
# ==============================================================================
export ZPLUG_HOME="${HOME}/.zsh/.zplug"
source ${ZPLUG_HOME}/init.zsh

# ==============================================================================
# Plugins
# ==============================================================================
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# ==============================================================================
# Plugin Configurations
# ==============================================================================
# zsh-history-substring-search
# OPTION 1: for most systems
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# OPTION 2: for iTerm2 running on Apple MacBook laptops
zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down
# OPTION 3: for Ubuntu 12.04, Fedora 21, and MacOSX 10.9
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
## EMACS mode ###########################################
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
## VI mode ##############################################
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ==============================================================================
# Load plugins
# ==============================================================================
zplug load --verbose
