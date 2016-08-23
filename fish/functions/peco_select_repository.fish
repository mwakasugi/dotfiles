function peco_select_repository
  ghq list -p | peco --layout=bottom-up --prompt "REPOSITORY>" | read line

  if [ $line ]
    builtin cd $line
    commandline -f repaint
  else
    commandline ''
  end
end
