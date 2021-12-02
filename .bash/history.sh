# append to history file instead of overwriting it
if [[ "$0" =~ bash$ ]] && [ -z "$ZSH" ]; then
  shopt -s histappend
fi

if ! [[ "$0" =~ bash$ ]]; then
  # ignore any commands starting with spaces
  setopt HIST_IGNORE_SPACE
fi


# ignore duplicates, lines starting with spaces, and some common one-off commands
export HISTCONTROL="ignoreboth"  # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll:ls -a:lls:git st:gi tst:clear"

# keep more history
export HISTFILESIZE=50000
export HISTSIZE=10000  # 500 is default

# Record date/time
export HISTTIMEFORMAT='%F %T '
#export HISTTIMEFORMAT='%b %d %I:%M %p '		# using strftime format

