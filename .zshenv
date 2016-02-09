# PATH configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# direnv
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# rbenv
if [ -d ${HOME}/.rbenv ] ; then
  PATH=${HOME}/.rbenv/bin:${PATH}
  export PATH
  eval "$(rbenv init -)"
fi

# nvm
# it also added in .zshenv
if [ -d ${HOME}/.nvm ] ; then
  export NVM_DIR="${HOME}/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

## Python virtualenv
#if [ -d ${HOME}/.virtualenvs ] ; then
#  export WORKON_HOME=$HOME/.virtualenvs
#elif [ -d /opt/.virtualenvs ] ; then
#  export WORKON_HOME=/opt/virtualenvs
#fi
#
#if hash virtualenvwrapper.sh 2> /dev/null; then
#  source `which virtualenvwrapper.sh`
#fi

# Go
if [ ! -d $HOME/.go ] ; then
  mkdir $HOME/.go
fi
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin

# heroku
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# mybin
export PATH=~/Laboratory/mybin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

# composer
export PATH=$HOME/.composer/vendor/bin:$PATH
