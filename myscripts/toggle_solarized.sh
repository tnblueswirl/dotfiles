if [[ "$ITERM_PROFILE" =~ Solarized ]]; then
  export ITERM_PROFILE="$(echo "$ITERM_PROFILE" | sed -e 's/Solarized/Solar/')"
else
  export ITERM_PROFILE="$(echo "$ITERM_PROFILE" | sed -e 's/Solar/Solarized/')"
fi
