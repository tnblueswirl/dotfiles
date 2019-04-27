if [ "$(which rbenv)" ] && [ ! $_PATH_SET ]; then
  eval "$(rbenv init -)"
fi
