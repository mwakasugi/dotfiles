#!/usr/bin/env bash -eu

function peco-git-checkout() {
  local l=$(git branch -a | peco --layout=bottom-up --prompt "BRANCH>" | tr -d ' ')

  if [ -n "$l" ]; then
    echo $l | grep -q -E '^.*remotes/.*$'
    local ret=$?

    if [ $ret -eq 0 ]; then
      local b=$(echo $l | sed -e 's/^\([^\/]*\)\/\([^\/]*\)\///g')
      READLINE_LINE="git checkout -b $b $l"
    else
      READLINE_LINE="git checkout $l"
    fi

    READLINE_POINT=${#READLINE_LINE}
  fi
}
