() {
  local widgets_dir="${HOME}/.zsh/widgets"
  FPATH="${widgets_dir}:${FPATH}"

  for func in `ls ${widgets_dir}`; do
    autoload -U ${func}
    zle -N ${func}
  done
}
