#!/usr/bin/env bash -eu

function peco-kill-process() {
  local l=$(ps aux | peco --layout=bottom-up --prompt "PROCESS>" | awk '{ print $2 }')

  if [ -n "$l" ]; then
    READLINE_LINE="kill $l"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
