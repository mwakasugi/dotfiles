#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null
script_path="$(pwd -P)"

cat << EOS

================================================================================
Creating symlinks
================================================================================
EOS
files=(.zshrc .zprofile .zsh)

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
Installing zplug
================================================================================
EOS
zplug_home="${HOME}/.zsh/.zplug"
if [ ! -d ${zplug_home} ]; then
  git clone https://github.com/zplug/zplug ${zplug_home}
else
  echo ".zplug seems to be already installed ([${zplug_home}] already exists) ."
fi

cat << EOS

================================================================================
Installation completed!

Please run "source ~/.zshrc" or re-enter zsh session.
(You also have to run "zplug install" to install plugins via zplug).

* With too old version of zsh, you cannot use full feature! *

You are using the following version of zsh:
EOS

zsh --version

cat << EOS
================================================================================
EOS

popd > /dev/null
