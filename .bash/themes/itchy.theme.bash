#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RBENV_THEME_PROMPT_PREFIX="("
RBENV_THEME_PROMPT_SUFFIX=")"

function prompt_command() {
    PS1="\n${yellow}$(ruby_version_prompt) ${cyan}\u${reset_color} @ ${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info)${reset_color} \`
if [ \$? = 0 ]; then
    echo 😉;
else
    echo 👿;
fi
\`  ${green}→${reset_color} "
}

safe_append_prompt_command prompt_command
