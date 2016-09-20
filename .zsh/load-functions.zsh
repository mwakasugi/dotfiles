() {
  local functions_dir="${HOME}/.zsh/functions"
  FPATH="${functions_dir}:${FPATH}"
}

autoload -U show-options
