# append to history file instead of overwriting it
shopt -s histappend

# ignore duplicates, lines starting with spaces, and some common one-off commands
export HISTCONTROL="ignoreboth"
export HISTIGNORE="exit:quit:bg:fg:ls:ll:lls:history"

# keep more history
export HISTFILESIZE=50000
export HISTSIZE=10000

# Record date/time
export HISTTIMEFORMAT='%F %T '
