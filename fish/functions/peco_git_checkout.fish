function peco_git_checkout
  git branch -a | peco --layout=bottom-up | tr -d ' ' | read branch

  if [ $branch ]
    if echo $branch | grep -q -E '^.*remotes/.*$'
    set -l b (echo $branch | awk -F'/' '{print $3}')
    git checkout -b $b $branch
    else
      command git checkout $branch
    end
  else
    commandline ''
  end
end
