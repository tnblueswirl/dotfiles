if [[ -r $HOME/.pythonrc ]]; then
  PYTHONSTARTUP=$HOME/.pythonrc
  export PYTHONSTARTUP
fi
