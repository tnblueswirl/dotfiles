if [[ -r $HOME/.pythonrc ]]; then
  PYTHONSTARTUP=$HOME/.pythonrc
  export PYTHONSTARTUP
fi

if [ -d "$HOME/.pyenv" ] \
  && [[ "$(which pyenv 2>1 > /dev/null | echo $?)" = 0 ]]
then
  eval "$(pyenv init -)"
fi


# For .bash_profile:

# if [ -d "$HOME/.pyenv" ] \
#   && [[ "$(which pyenv 2> /dev/null | echo $?)" = 0 ]]
# then
#   export PYENV_ROOT="$HOME/.pyenv"
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init --path)"
# fi
