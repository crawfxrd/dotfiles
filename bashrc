#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

PS1='\[\e[1;36m\][\h \w]\$\[\e[m\] '

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100
export HISTFILESIZE=1000
shopt -s histappend

#export CC=clang
#export CXX=clang++

export VISUAL=vim
export EDITOR="${VISUAL}"

if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias cls='clear'
alias grep='grep --color=auto -I'
alias ls='ls --color=auto --group-directories-first --file-type'
alias vim='nvim'
alias vi='nvim'
alias cf='clang-format -i -style=file'
alias gs='git status'
alias gpg='gpg2'

complete -cf sudo
stty -ixon

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
