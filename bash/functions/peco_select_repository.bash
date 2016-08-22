#!/usr/bin/env bash

function peco_select_repository() {
  line=$(ghq list -p | peco --layout=bottom-up)

  if [ -n "$line" ]; then
    cd $line
  fi
}
