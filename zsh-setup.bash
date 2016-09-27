#!/usr/bin/env bash -eu

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
Installation completed!

Please run "source ~/.zshrc" or re-enter zsh session.

* With too old version of zsh, you cannnot use full feature! *

You are using the following version of zsh:
EOS

zsh --version

cat << EOS
================================================================================
EOS

popd > /dev/null
