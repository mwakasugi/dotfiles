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
  yes | ${HOME}/.bash_it/install.sh
else
  echo "bash-it seems to be already installed ([${HOME}/.bash_it] already exists) ."
fi

bash_it_files=(.bashrc .bash_profile .bashrc.bak .bash_profile.bak)

for i in "${bash_it_files[@]}"; do
  if [ -f ${HOME}/${i} ]; then
    # Remove files created by bash-it
    rm ${HOME}/${i}
  fi
done

cat << EOS

================================================================================
Creating symlinks
================================================================================
EOS
files=(.bashrc .bash_profile .bash)

for i in "${files[@]}"; do
  if [ ! -e ${HOME}/${i} ]; then
    ln -s ${script_path}/${i} ${HOME}/${i}
    echo "Symlink [${HOME}/${i}] is created."
  else
    echo "Failed to set symlink [${i}] because [${HOME}/${i}] already exists."
  fi
done

cat << EOS

================================================================================
Configuring bash-it
================================================================================
EOS
source ${HOME}/.bash_profile >/dev/null 2>&1

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
plugins_to_enable=(alias-completion base rbenv z)
for i in "${plugins_to_enable[@]}"; do
  bash-it enable plugin $i
done

cat << EOS

================================================================================
Installation completed!

Please run "source ~/.bashrc" or re-enter bash session.

* Bash version must be 4 or later to use full feature! *

You are using the following version of bash.
Please install 4 or later version of bash if not.
================================================================================

EOS

bash --version

popd > /dev/null
