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

() {
  if (( $+commands[go] )); then
    local gopath="${HOME}/go"

    if [ ! -d "${gopath}" ]; then
      mkdir "${gopath}"
    fi

    export GOPATH="${gopath}"
    export PATH=${PATH}:${GOPATH}/bin
  fi
}

() {
  if (( $+commands[yarn] )); then
    export PATH="$PATH:$(yarn global bin)"
  fi
}
