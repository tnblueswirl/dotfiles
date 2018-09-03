if [ $(which rbenv) -a ! $_PATH_SET ]; then
  eval "$(rbenv init -)"
fi
