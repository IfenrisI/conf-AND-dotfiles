#
# ~/.zshrc
#

### options ###
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt no_beep auto_cd rm_star_wait nomatch notify
eval `dircolors`
bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload –Uz compinit && colors
compinit
colors

## aliases ###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias la='ls -a'
alias lls='ls -l'
alias lla='ls -la'
alias lsnew='ls –tlh | head'

alias unilog='ssh a<Matrikel-Nr>@almighty.cs.univie.ac.at'
alias backup='rsync -a'
alias reload='source ~/.bashrc'

## prompt ###
local GIT=''
local GIT_REPO_PATH=`git rev-parse --git-dir 2>/dev/null`
if [[ $GIT_REPO_PATH != '' && $GIT_REPO_PATH != '~' && $GIT_REPO_PATH != "$HOME/.git" ]]; then
    local GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
    local GIT_DIRTY=''
    if [[ "$GIT_REPO_PATH" != '.' && `git ls-files -m` != "" ]]; then
      local GIT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
    fi
    local GIT='git:$GIT_BRANCH $GIT_DIRTY'
fi
#local SMILEY='%(?,%{$fg[green]%}:){$reset_color%},%{$fg[red]%}:({$reset_color%})'
local ERROR_MESS='%(?..%{$fg[red]%}:({$reset_color%} !-1 not found!)' 

PROMPT='%{$fg[yellow]%}╭%{$reset_color%}[%{$fg[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}: %{$fg[magenta]%}%~%{$reset_color%}] (%{$fg[white]%}$GIT%{$reset_color%})
%{$fg[yellow]%}╰➤%{$reset_color%}%  '
RPROMPT='$ERROR_MESS'
#backup symbol: »