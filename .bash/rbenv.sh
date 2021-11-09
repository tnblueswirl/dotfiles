if [[ "$(which rbenv 2>&1 > /dev/null | echo $?)" = 0 ]]; then
  eval "$(rbenv init -)"
fi
