function peco_find
  find . -name "*$argv[1]*" | grep -v "/\." | peco --layout=bottom-up --prompt "FIND>" | read line

  if [ $line ]
    commandline $line
  else
    commandline ''
  end
end
