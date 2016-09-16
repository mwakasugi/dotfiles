function peco_git_checkout
  git branch -a | peco --layout=bottom-up --prompt "BRANCH>" | tr -d ' ' | read branch

  if [ $branch ]
    if echo $branch | grep -q -E '^.*remotes/.*$'
      set -l b (echo $branch | sed -e 's/^\([^\/]*\)\/\([^\/]*\)\///g')
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
