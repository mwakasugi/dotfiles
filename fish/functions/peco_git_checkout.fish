function peco_git_checkout
  git branch -a | peco --layout=bottom-up | tr -d ' ' | read branch

  if [ $branch ]
    if echo $branch | grep -q -E '^.*remotes/.*$'
      set -l b (echo $branch | awk -F'/' '{print $3}')
      command git checkout -b $b $branch
      commandline -f repaint
    else
      command git checkout $branch
      commandline -f repaint
    end
  else
    commandline ''
  end
end
