autoload -Uz add-zsh-hook
setopt prompt_subst

function _git_prompt_info() {
  typeset -A git_status
  local git_status_lines git_prompt

  git_status_lines=("${(f)$(git status --porcelain --branch 2> /dev/null)}")

  (( $? == 0 )) && {
    git_status[branch]="${${${git_status_lines[1]}/\#\# /}/...*/}"
    shift git_status_lines
    git_status[changed]=${#git_status_lines:#\?\?\ *}
    git_status[untracked]=$(( $#git_status_lines - ${git_status[changed]} ))
    git_status[clean]=$(( $#git_status_lines == 0 ))

    git_prompt=("on %{%F{green}%}${git_status[branch]}%{%f%}")
    (( ${git_status[clean]}     )) && git_prompt+=("🐖")
    (( ${git_status[changed]}   )) && git_prompt+=("🐄  %{%F{yellow}%}${git_status[changed]}%{%f%}")
    (( ${git_status[untracked]} )) && git_prompt+=("🐐  %{%F{red}%}${git_status[untracked]}%{%f%}")
  }

  git_prompt_info="${git_prompt}"
}

add-zsh-hook precmd _git_prompt_info

() {
  local user='%{%F{cyan}%}%n%{%f%}'
  local host='%{%F{blue}%}%m%{%f%}'
  local dir='%{%F{yellow}%}%~%{%f%}'
  local smiley="%(?,😉,👿)"
  [ "${SSH_CLIENT}" ] && local via="${${=SSH_CLIENT}[1]} %{%B%}->%{%b%} "
  local git='$git_prompt_info'
  local nl=$'\n'
  PROMPT="${user} (${via}${host}) ${dir} ${git}${nl}${smiley}  "
  RPROMPT="(ruby: $(rbenv version-name))"
}
