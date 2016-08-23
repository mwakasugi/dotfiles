function peco_kill_process
  ps aux | peco --layout=bottom-up --prompt "PROCESS>" | awk '{ print $2 }' | read line

  if [ $line ]
    command kill $line
    echo $line is killed
  else
    commandline ''
  end
end
