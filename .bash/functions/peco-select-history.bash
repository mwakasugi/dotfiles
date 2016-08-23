#!/usr/bin/env bash -eu

function peco-select-history() {
  local tac

  if hash tac 2>/dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi

  local l=$(history | awk '{ $1=""; print }' | eval $tac | peco --layout=bottom-up --prompt "HISTORY>")

  if [ -n "$l" ]; then
    READLINE_LINE="$l"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
