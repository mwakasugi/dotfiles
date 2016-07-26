function peco_kill_process
  ps aux | peco --layout=bottom-up | awk '{ print $2 }' | read line

  if [ $line ]
    command kill $line
  else
    commandline ''
  end
end
