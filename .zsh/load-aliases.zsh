() {
  local aliases_dir="${HOME}/.zsh/aliases"

  for alias in `ls ${aliases_dir}`; do
    source ${aliases_dir}/${alias}
  done
}
