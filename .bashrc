#
# ~/.bashrc
#

set -o vi
source $HOME/.config/aliasrc
source $HOME/.config/exports
EDITOR='nvim'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="[\[\e[33m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\] \[\e[36m\]\W\[\e[m\]]\$ "

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
