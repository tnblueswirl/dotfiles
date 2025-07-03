# set where virtual environments will live
export WORKON_HOME=$HOME/.virtualenvs

# use Python 3
export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/versions/3.9.6/bin/python3

# specify the location of virtualenv (`pip3 install virtualenv virtualenvwrapper`)
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.pyenv/versions/3.9.6/bin/virtualenv

# ensure we clear out this arg
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=

# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true

if [[ -r $HOME/.pyenv/versions/3.9.6/bin/virtualenvwrapper.sh ]]; then
  VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/versions/3.9.6/bin/python
  source $HOME/.pyenv/versions/3.9.6/bin/virtualenvwrapper.sh
fi
