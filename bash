#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias dig='echo "You mean drill!"; echo; drill '

BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
PS1="${BOLD}[$?] \h \W > ${RESET}"

export EDITOR=nano
export TERM=xterm

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
