() {
  if (( $+commands[rbenv] )); then
    PATH=${HOME}/.rbenv/bin:${PATH}
    export PATH
    eval "$(rbenv init -)"
  fi
}

() {
  if (( $+commands[pyenv] )); then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
  fi
}
