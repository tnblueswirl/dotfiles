#### COLOUR (Solarized Dark)

SOLARIZED_BASE01=colour240
SOLARIZED_BASE0=colour244
SOLARIZED_CYAN=colour37
SOLARIZED_GREEN=colour64
SOLARIZED_MAGENTA=colour125
SOLARIZED_ORANGE=colour166
SOLARIZED_RED=colour160
SOLARIZED_VIOLET=colour61
SOLARIZED_YELLOW=colour136

TM_COLOR_ACTIVE=$SOLARIZED_ORANGE
TM_COLOR_INACTIVE=$SOLARIZED_BASE0
TM_COLOR_DATE=$SOLARIZED_GREEN
TM_COLOR_FEATURE=$SOLARIZED_YELLOW
TM_COLOR_MUSIC=$SOLARIZED_VIOLET
TM_ACTIVE_BORDER_COLOR=$SOLARIZED_BASE01

TM_ICON=""
# separators
# TM_SEPARATOR_LEFT_BOLD="◀"
# TM_SEPARATOR_LEFT_THIN="❮"
# TM_SEPARATOR_RIGHT_BOLD="▶"
# TM_SEPARATOR_RIGHT_THIN="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
set-option -g status-style fg=$TM_COLOR_ACTIVE

# default window title colors
set-window-option -g window-status-style fg=$TM_COLOR_INACTIVE
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$TM_COLOR_ACTIVE
set-window-option -g window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-style fg=$TM_COLOR_INACTIVE
set-option -g pane-active-border-style fg=$TM_ACTIVE_BORDER_COLOR

# message text
set-option -g message-style fg=$TM_COLOR_ACTIVE

# pane number display
set-option -g display-panes-active-colour $TM_COLOR_ACTIVE
set-option -g display-panes-colour $TM_COLOR_INACTIVE

# clock
set-window-option -g clock-mode-colour $TM_COLOR_ACTIVE

TM_TUNES="#[fg=$TM_COLOR_MUSIC]#(osascript ~/.dotfiles/applescripts/tunes.scpt)"
# TM_BATTERY="#(~/.dotfiles/bin/battery_indicator.sh)"

TM_DATE="#[fg=$TM_COLOR_DATE] %l:%M %p  %b %-e "
TM_HOST="#[fg=$TM_COLOR_FEATURE,bold]#h"
TM_SESSION_NAME="#[fg=$TM_COLOR_FEATURE,bold]$TM_ICON #S"

set -g status-left $TM_SESSION_NAME' '
set -g status-right $TM_TUNES' '$TM_DATE' '$TM_HOST
