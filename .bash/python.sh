if [ -r $HOME/.pythonrc ]; then
  PYTHONSTARTUP=$HOME/.pythonrc
  export PYTHONSTARTUP
fi

if [ -d "$HOME/.pyenv" ] && command -v pyenv 2>&1 >/dev/null ; then
  eval "$(pyenv init -)"
fi


# For .bash_profile / .zprofile:

# if [ -d "$HOME/.pyenv" ] && command -v pyenv 2>&1 >/dev/null ; then
#   export PYENV_ROOT="$HOME/.pyenv"
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init --path)"
# fi
