#!/usr/bin/env bash -eu

function peco-git-checkout() {
  local l=$(git branch -a | peco --layout=bottom-up --prompt "BRANCH>" | tr -d ' ')

  if [ -n "$l" ]; then
    if echo $l | grep -q -E '^.*remotes/.*$'; then
      echo $l
      local b=$(echo $l | awk -F'/' '{print $3}')
      READLINE_LINE="git checkout -b $b $l"
    else
      READLINE_LINE="git checkout $l"
    fi

    READLINE_POINT=${#READLINE_LINE}
  fi
}
