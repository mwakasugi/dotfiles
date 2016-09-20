local smiley="%(?,😉,👿)"

local user="%{$fg[cyan]%}%n%{$reset_color%}"
local host="%{$fg[cyan]%}@%m%{$reset_color%}"
local pwd="%{$fg[yellow]%}%~%{$reset_color%}"

PROMPT="${user}${host} ${pwd}
${smiley}  "
