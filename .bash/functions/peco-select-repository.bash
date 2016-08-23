#!/usr/bin/env bash -eu

function peco-select-repository() {
  local l=$(ghq list -p | peco --layout=bottom-up --prompt "REPOSITORY>")

  if [ -n "$l" ]; then
    READLINE_LINE="cd $l"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
