export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ${HOME}/.rbenv ] ; then
  PATH=${HOME}/.rbenv/bin:${PATH}
  export PATH
  eval "$(rbenv init -)"
fi
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
