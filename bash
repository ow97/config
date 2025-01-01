#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias dig='echo "You mean drill!"; echo; drill '
alias rm='if [[ $- == *i* ]]; then echo waiting 5s ...; sleep 5; fi && rm'
export BOLD="\[$(tput bold)\]"
export RESET="\[$(tput sgr0)\]"
export PS1="${BOLD}[$?] \h \W > ${RESET}"

export EDITOR=nano
export TERM=xterm

export MOZ_USE_XINPUT2=1
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

