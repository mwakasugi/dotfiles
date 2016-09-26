() {
  if type rbenv >/dev/null 2>&1; then
    PATH=${HOME}/.rbenv/bin:${PATH}
    export PATH
    eval "$(rbenv init -)"
  fi
}
