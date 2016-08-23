#!/usr/bin/env bash

pushd $(dirname $0) > /dev/null
script_path=$(pwd -P)

cat << EOS

================================================================================
Installing bash-it
================================================================================
EOS
if [ ! -d ${HOME}/.bash_it ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ${HOME}/.bash_it
  ${HOME}/.bash_it/install.sh
else
  echo "bash-it seems to be already installed ([${HOME}/.bash_it] already exists) ."
fi

rm ${HOME}/.bash_profile # Remove default .bash_profile installed by bash-it

if [ -f ${HOME}/.bash_profile.bak ]; then
  rm ${HOME}/.bash_profile.bak # Remove .bash_profile backup created by bash-it
fi

cat << EOS

================================================================================
Creating symlinks
================================================================================
EOS
files=(.bashrc .bash_profile .bash)

for i in "${files[@]}"; do
  if [ ! -e ${HOME}/${i} ]; then
    ln -s ${script_path}/${i} ${HOME}/${i}
  else
    echo "Failed to set symlink [${i}] because [${HOME}/${i}] already exists."
  fi
done

cat << EOS

================================================================================
Configuring bash-it
================================================================================
EOS
source ${HOME}/.bash_profile

echo '---------- bash-it aliases ----------'
bash-it disable alias all
aliases_to_enable=(bundler fuck general git rails)
for i in "${aliases_to_enable[@]}"; do
  bash-it enable alias $i
done

echo '---------- bash-it completions ----------'
bash-it disable completion all
completions_to_enable=(bash-it bundler docker git system)
for i in "${completions_to_enable[@]}"; do
  bash-it enable completion $i
done

echo '---------- bash-it plugins ----------'
bash-it disable plugin all
plugins_to_enable=(alias-completion base pyenv rbenv z)
for i in "${plugins_to_enable[@]}"; do
  bash-it enable plugin $i
done

cat << EOS

================================================================================
Installation completed

*** Bash version must be 4 or later to use full feature! ***
================================================================================

EOS

popd > /dev/null
