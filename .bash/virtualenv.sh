# set where virtual environments will live
export WORKON_HOME=$HOME/.virtualenvs

# use Python 3
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# specify the location of virtualenv (`pip3 install virtualenv virtualenvwrapper`)
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

# ensure we clear out this arg
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=

# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
