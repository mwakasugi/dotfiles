#!/usr/bin/env bash

set -Ceu

# ANSI Escape Color Codes
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

UNAME="`uname`"

case $UNAME in
  'Linux')
    OS='Linux'
    ;;
  # 'FreeBSD')
  #   OS='FreeBSD'
  #   ;;
  # 'WindowsNT')
  #   OS='Windows'
  #   ;;
  'Darwin')
    OS='Mac'
    ;;
  # 'SunOS')
  #   OS='Solaris'
  #   ;;
  # 'AIX') ;;
  *) ;;
esac

pushd "$(dirname $0)" > /dev/null
SCRIPT_PATH="$(pwd -P)"

# ==============================================================================

cat << EOS

================================================================================
Setup plain old dotfiles
================================================================================
EOS

FILES=( \
  .direnvrc \
)

case $OS in
  'Linux')
    ;;
  'Mac')
    MAC_ONLY_FILES=( \
      .ideavimrc \
      .xvimrc \
    )
    FILES=("${FILES[@]}" "${MAC_ONLY_FILES[@]}")
    ;;
  *)
    ;;
esac

for i in "${FILES[@]}"; do
  if [ -e "${HOME}/${i}" ] && [ ! -L "${HOME}/${i}" ] ; then
    echo -e "${RED}ERROR: Failed to create symlink [${i}] because [${HOME}/${i}] already exists.${NC}"
    continue
  fi

  if [ -e "${HOME}/${i}" ] && [ -L "${HOME}/${i}" ] ; then
    rm "${HOME}/${i}"
    echo -e "${BLUE}WARN: Existing symlink [${HOME}/${i}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/${i}" "${HOME}/${i}"
  echo -e "${CYAN}INFO: Symlink [${HOME}/${i}] is created.${NC}"
done

# ==============================================================================

cat << EOS

================================================================================
Setup VSCode
================================================================================
EOS

case $OS in
  'Linux')
    ;;
  'Mac')
    if [ ! -e "${VSCODE_CONFIG_ROOT:=$HOME/Library/Application Support/Code}" ] ; then
      echo -e "${BLUE}WARN: [${VSCODE_CONFIG_ROOT}] is not found. Maybe VSCode is not installed.${NC}"
    else
      if [ -e "${VSCODE_CONFIG_PATH:=$VSCODE_CONFIG_ROOT/User}" ] && [ ! -L "${VSCODE_CONFIG_PATH}" ] ; then
        echo -e "${RED}ERROR: Failed to create symlink [${VSCODE_CONFIG_PATH}] because it already exists.${NC}"
      else
        if [ -L "${VSCODE_CONFIG_PATH}" ] ; then
          rm "${VSCODE_CONFIG_PATH}"
          echo -e "${BLUE}WARN: Existing symlink [${VSCODE_CONFIG_PATH}] is deleted.${NC}"
        fi

        ln -s "${SCRIPT_PATH}/vscode/User_mac" "${VSCODE_CONFIG_PATH}"
        echo -e "${CYAN}INFO: Symlink [${VSCODE_CONFIG_PATH}] is created.${NC}"
      fi
    fi
    ;;
  *)
    ;;
esac

# ==============================================================================

cat << EOS

================================================================================
Setup TMUX
================================================================================
EOS

if [ -e "${TMUX_CONF_PATH:=$HOME/.tmux.conf}" ] && [ ! -L "${TMUX_CONF_PATH}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${TMUX_CONF_PATH}] because it already exists.${NC}"
else
  if [ -L "${TMUX_CONF_PATH}" ] ; then
    rm "${TMUX_CONF_PATH}"
    echo -e "${BLUE}WARN: Existing symlink [${TMUX_CONF_PATH}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/.tmux/.tmux.conf" "${TMUX_CONF_PATH}"
  echo -e "${CYAN}INFO: Symlink [${TMUX_CONF_PATH}] is created.${NC}"
fi

if [ -e "${TMUX_LOCAL_CONF_PATH:=$HOME/.tmux.conf.local}" ] && [ ! -L "${TMUX_LOCAL_CONF_PATH}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${TMUX_LOCAL_CONF_PATH}] because it already exists.${NC}"
else
  if [ -L "${TMUX_LOCAL_CONF_PATH}" ] ; then
    rm "${TMUX_LOCAL_CONF_PATH}"
    echo -e "${BLUE}WARN: Existing symlink [${TMUX_LOCAL_CONF_PATH}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/.tmux.conf.local" "${TMUX_LOCAL_CONF_PATH}"
  echo -e "${CYAN}INFO: Symlink [${TMUX_LOCAL_CONF_PATH}] is created.${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setting up XDG Base Directory
================================================================================
EOS

if [ ! -d "${XDG_CONFIG_HOME:=$HOME/.config}" ] ; then
  mkdir -p "${XDG_CONFIG_HOME}"
else
  echo -e "${BLUE}WARN: XDC Base directory: [${XDG_CONFIG_HOME}] already exists${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setup global Git config
================================================================================
EOS

if [ -e "${GIT_CONFIG_DIR:=$XDG_CONFIG_HOME/git}" ] && [ ! -L "${GIT_CONFIG_DIR}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${GIT_CONFIG_DIR}] because it already exists.${NC}"
else
  if [ -L "${GIT_CONFIG_DIR}" ] ; then
    rm "${GIT_CONFIG_DIR}"
    echo -e "${BLUE}WARN: Existing symlink [${GIT_CONFIG_DIR}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/git" "${GIT_CONFIG_DIR}"
  echo -e "${CYAN}INFO: Symlink [${GIT_CONFIG_DIR}] is created.${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setup Doom Emacs
================================================================================
EOS

if [ -e "${DOOM_CONFIG_DIR:=$XDG_CONFIG_HOME/doom}" ] && [ ! -L "${DOOM_CONFIG_DIR}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${DOOM_CONFIG_DIR}] because it already exists.${NC}"
else
  if [ -L "${DOOM_CONFIG_DIR}" ] ; then
    rm "${DOOM_CONFIG_DIR}"
    echo -e "${BLUE}WARN: Existing symlink [${DOOM_CONFIG_DIR}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/doom" "${DOOM_CONFIG_DIR}"
  echo -e "${CYAN}INFO: Symlink [${DOOM_CONFIG_DIR}] is created.${NC}"
fi

# ==============================================================================


cat << EOS

================================================================================
Setup fish shell
================================================================================
EOS

cat << EOS

Checking fish installation
--------------------------------------------------------------------------------
EOS

if type fish > /dev/null 2>&1 ; then
    echo -e "${CYAN}INFO: fish shell is installed.${NC}"
else
    echo -e "${RED}ERROR: fish is not found.${NC}"
    cat << EOS
Please install fish before executing this setup script.
See https://fishshell.com for further details.

If using macOS, you may have to add fish executable path to /private/etc/shells before "chsh".
EOS
    exit 1
fi

cat << EOS

Creating symlink to fish config
--------------------------------------------------------------------------------
EOS

if [ -e "${FISH_CONFIG_DIR:=$XDG_CONFIG_HOME/fish}" ] && [ ! -L "${FISH_CONFIG_DIR}" ] ; then
    echo -e "${RED}ERROR: Failed to create symlink [${FISH_CONFIG_DIR}] because it already exists.${NC}"
else
    if [ -L "${FISH_CONFIG_DIR}" ] ; then
        rm "${FISH_CONFIG_DIR}"
        echo -e "${BLUE}WARN: Existing symlink [${FISH_CONFIG_DIR}] is deleted.${NC}"
    fi

    ln -s "${SCRIPT_PATH}/fish" "${FISH_CONFIG_DIR}"
    echo -e "${CYAN}INFO: Symlink [${FISH_CONFIG_DIR}] is created.${NC}"
fi

cat << EOS

Installing Fisher
--------------------------------------------------------------------------------
EOS

if fish -c 'type fisher  >/dev/null ^/dev/null' ; then
    echo -e "${CYAN}INFO: Fisher is already installed.${NC}"
else
    echo -e "${CYAN}INFO: Installing Fisher.${NC}"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fi

cat << EOS

Installing plugins
--------------------------------------------------------------------------------
EOS

fish -c 'fisher'

cat << EOS

Installation complete!
--------------------------------------------------------------------------------
Recommended way to configure your local specific configuration is
adding settings in [${FISH_CONFIG_DIR}/config.local.fish]
instead of [${FISH_CONFIG_DIR}/config.fish].

EOS

popd > /dev/null
