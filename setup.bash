#!/usr/bin/env bash -eu

# ANSI Escape Color Codes
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

uname="`uname`"

case $uname in
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
script_path="$(pwd -P)"


cat << EOS

================================================================================
Setup plain old dotfiles
================================================================================
EOS

files=( \
  .gitconfig \
  .gitignore_global \
  .spacemacs \
)

case $OS in
  'Linux')
    ;;
  'Mac')
    mac_only_files=( \
      .ideavimrc \
      .xvimrc \
    )
    files=("${files[@]}" "${mac_only_files[@]}")
    ;;
  *)
    ;;
esac

for i in "${files[@]}"; do
  if [ -e "${HOME}/${i}" ] && [ ! -L "${HOME}/${i}" ] ; then
    echo -e "${RED}ERROR: Failed to create symlink [${i}] because [${HOME}/${i}] already exists.${NC}"
    continue
  fi

  if [ -e "${HOME}/${i}" ] && [ -L "${HOME}/${i}" ] ; then
    rm "${HOME}/${i}"
    echo -e "${BLUE}WARN: Existing symlink [${HOME}/${i}] is deleted.${NC}"
  fi

  ln -s "${script_path}/${i}" "${HOME}/${i}"
  echo -e "${CYAN}INFO: Symlink [${HOME}/${i}] is created.${NC}"
done


cat << EOS

================================================================================
Setup VSCode
================================================================================
EOS

case $OS in
  'Linux')
    ;;
  'Mac')
    vscode_config_root="${HOME}/Library/Application Support/Code"
    vscode_config_path="${vscode_config_root}/User"
    vscode_user_path="${script_path}/vscode/User_mac"

    if [ ! -e "${vscode_config_root}" ] ; then
      echo -e "${BLUE}WARN: [${vscode_config_root}] is not found. Maybe VSCode is not installed.${NC}"
    else
      if [ -e "${vscode_config_path}" ] && [ ! -L "${vscode_config_path}" ] ; then
        echo -e "${RED}ERROR: Failed to create symlink [${vscode_config_path}] because it already exists.${NC}"
      else
        if [ -e "${vscode_config_path}" ] && [ -L "${vscode_config_path}" ] ; then
          rm "${vscode_config_path}"
          echo -e "${BLUE}WARN: Existing symlink [${vscode_config_path}] is deleted.${NC}"
        fi

        ln -s "${vscode_user_path}" "${vscode_config_path}"
        echo -e "${CYAN}INFO: Symlink [${vscode_config_path}] is created.${NC}"
      fi
    fi
    ;;
  *)
    ;;
esac


cat << EOS

================================================================================
Setup TMUX
================================================================================
EOS

if [ -e "${HOME}/.tmux.conf" ] && [ ! -L "${HOME}/.tmux.conf" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${HOME}/.tmux.conf] because it already exists.${NC}"
else
  if [ -e "${HOME}/.tmux.conf" ] && [ -L "${HOME}/.tmux.conf" ] ; then
    rm "${HOME}/.tmux.conf"
    echo -e "${BLUE}WARN: Existing symlink [${HOME}/.tmux.conf] is deleted.${NC}"
  fi

  ln -s "${script_path}/.tmux/.tmux.conf" "${HOME}/.tmux.conf"
  echo -e "${CYAN}INFO: Symlink [${HOME}/.tmux.conf] is created.${NC}"
fi

if [ -e "${HOME}/.tmux.conf.local" ] && [ ! -L "${HOME}/.tmux.conf.local" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${HOME}/.tmux.conf.local] because it already exists.${NC}"
else
  if [ -e "${HOME}/.tmux.conf.local" ] && [ -L "${HOME}/.tmux.conf.local" ] ; then
    rm "${HOME}/.tmux.conf.local"
    echo -e "${BLUE}WARN: Existing symlink [${HOME}/.tmux.conf.local] is deleted.${NC}"
  fi

  ln -s "${script_path}/.tmux/.tmux.conf.local" "${HOME}/.tmux.conf.local"
  echo -e "${CYAN}INFO: Symlink [${HOME}/.tmux.conf.local] is created.${NC}"
fi


cat << EOS

================================================================================
Install Spacemacs
================================================================================
EOS

if [ -e "${HOME}/.emacs.d" ] && [ ! -L "${HOME}/.emacs.d" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${HOME}/.emacs.d] because it already exists.${NC}"
else
  if [ -e "${HOME}/.emacs.d" ] && [ -L "${HOME}/.emacs.d" ] ; then
    rm "${HOME}/.emacs.d"
    echo -e "${BLUE}WARN: Existing symlink [${HOME}/.emacs.d] is deleted.${NC}"
  fi

  ln -s "${script_path}/spacemacs" "${HOME}/.emacs.d"
  echo -e "${CYAN}INFO: Symlink [${HOME}/.emacs.d] is created.${NC}"
fi
