#!/usr/bin/env bash -eu

function peco_git_checkout() {
  local line=$(git branch -a | peco --layout=bottom-up | tr -d ' ')

  if [ -n "$line" ]; then
    # if echo $line | grep -q -E '^.*remotes/.*$'
    #   set -l b (echo $branch | awk -F'/' '{print $3}')
    #   command git checkout -b $b $branch
    #   commandline -f repaint
    # else
      git checkout $branch
    # fi
  fi
}
