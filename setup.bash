#!/usr/bin/env bash -eu

pushd "$(dirname $0)" > /dev/null
script_path="$(pwd -P)"

cat << EOS

================================================================================
Setup plain old dotfiles
================================================================================

EOS

# files=(.gemrc .gitconfig .gitignore_global .pryrc .tigrc .rubocop.yml .scss-lint.yml .csscomb.json .tmux.conf .spacemacs .jruby_art .emacs.d .atom .ideavimrc)
files=(.gemrc .gitconfig .gitignore_global .pryrc .tigrc .rubocop.yml .scss-lint.yml .csscomb.json .tmux.conf .atom .ideavimrc)

for i in "${files[@]}"; do
  if [ ! -L "${HOME}/${i}" ] && [ ! -e "${HOME}/${i}" ]; then
    ln -s "${script_path}/${i}" "${HOME}/${i}"
    echo "Symlink [${HOME}/${i}] is created."
  else
    echo "Failed to create symlink [${i}] because [${HOME}/${i}] already exists."
  fi
done


cat << EOS

================================================================================
Setup XDG Base Directory
================================================================================

EOS

if [ ! -d "${XDG_CONFIG_HOME:=$HOME/.config}" ]; then
  mkdir -p "${XDG_CONFIG_HOME}"
else
  echo "XDC Base directory: ${XDG_CONFIG_HOME} already exists"
fi

# dirs=(fish powerline)
dirs=(powerline)

for i in "${dirs[@]}"; do
  if [ ! -L "${XDG_CONFIG_HOME}/${i}" ] && [ ! -e "${XDG_CONFIG_HOME}/${i}" ]; then
    ln -s "${script_path}/${i}" "${XDG_CONFIG_HOME}/${i}"
    echo "Symlink [${XDG_CONFIG_HOME}/${i}] is created."
  else
    echo "Failed to create symlink [${i}] because [${XDG_CONFIG_HOME}/${i}] already exists."
  fi
done


cat << EOS

================================================================================
Setup VSCode
================================================================================

EOS

vscode_config_path="${HOME}/Library/Application Support/Code/User"

if [ -d "${vscode_config_path}" ]; then
  rm -rf "${vscode_config_path}"
  echo "Existing [${vscode_config_path}] is deleted."
fi

ln -s "${script_path}/vscode/User" "${vscode_config_path}"
