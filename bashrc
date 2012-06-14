#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Bash calculator
? () { echo "$*" | bc -l; }

alias sudo='sudo '
alias pacman='pacman-color'

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lls='ls -l --color=auto'
alias lla='ls -la --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias unilog='ssh a<Matrikel-Nr>@almighty.cs.univie.ac.at'
alias backup='rsync -a'
alias reload='source ~/.bashrc'

# Bash-Prompt
PS1='[\[\033[0;32m\]\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0m\]: \[\033[1;34m\]\w/\[\033[0m\]]$(__git_ps1 " (\[\033[1;36m\]git\[\033[0m\]: \[\033[1;35m\]%s\[\033[0m\])") (\[\033[0;35m\]\l\[\033[0m\])\n\[\033[1;33m\]>\[\033[0m\] '

# original:
#PS1='[\u@\h \W]\$ '
