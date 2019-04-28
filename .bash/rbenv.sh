if [ $(which rbenv 2> /dev/null) ] && [ ! $_PATH_SET ]; then
  eval "$(rbenv init -)"
fi
