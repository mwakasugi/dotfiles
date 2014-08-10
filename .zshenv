export PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [ -d ${HOME}/.rbenv ] ; then
  PATH=${HOME}/.rbenv/bin:${PATH}
  export PATH
  eval "$(rbenv init -)"
fi

if [ -d ${HOME}/.ndenv ] ; then
  PATH=${HOME}/.ndenv/bin:${PATH}
  export PATH
  eval "$(ndenv init -)"
fi
