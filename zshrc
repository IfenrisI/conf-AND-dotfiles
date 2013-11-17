#
# ~/.zshrc
#


## options ##
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt auto_cd rm_star_wait nomatch notify
unsetopt beep
eval `dircolors`
bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload –Uz compinit
compinit
autoload colors && colors

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/philipp/.zshrc'


## aliases ##
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

alias unilog='ssh a0808368@almighty.cs.univie.ac.at'
alias backup='rsync -a'
alias reload='source ~/.zshrc'


## prompt ##
local GIT=''
local GIT_REPO_PATH=`git rev-parse --git-dir 2>/dev/null`
if [[ $GIT_REPO_PATH != '' && $GIT_REPO_PATH != '~' && $GIT_REPO_PATH != "$HOME/.git" ]]; then
  local GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
  local GIT_DIRTY=''
  if [[ "$GIT_REPO_PATH" != '.' && `git ls-files -m` != "" ]]; then
    local GIT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
  fi
  local GIT='(git:$GIT_BRANCH $GIT_DIRTY)'
fi
#local SMILEY='%(?,%{$fg[green]%}:){$reset_color%},%{$fg[red]%}:({$reset_color%})'
local ERROR='%(?..retry!)'

PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}: %{$fg_bold[blue]%}%~/%{$reset_color%}] %{$fg[white]%}$GIT%{$reset_color%}
%{$fg_bold[yellow]%}➤%{$reset_color%}%  "
RPROMPT="$ERROR "

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Backup:
#PROMPT='[%n@%m: %~/]
#>> '