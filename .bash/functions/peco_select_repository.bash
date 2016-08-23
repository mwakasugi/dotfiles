#!/usr/bin/env bash -eu

function peco_select_repository() {
  local line=$(ghq list -p | peco --layout=bottom-up)

  if [ -n "$line" ]; then
    cd $line
  fi
}
