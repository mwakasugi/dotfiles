() {
  local functions_dir="${HOME}/.zsh/functions"
  FPATH="${functions_dir}:${FPATH}"

  for func in `ls ${functions_dir}`; do
    autoload -U ${func}
  done
}
