# append to history file instead of overwriting it
shopt -s histappend

# ignore duplicates, lines starting with spaces, and some common one-off commands
export HISTCONTROL="ignoreboth"  # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll:ls -a:lls:git st:gi tst"

# keep more history
export HISTFILESIZE=50000
export HISTSIZE=10000  # 500 is default

# Record date/time
export HISTTIMEFORMAT='%F %T '
#export HISTTIMEFORMAT='%b %d %I:%M %p '		# using strftime format

