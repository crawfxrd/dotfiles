#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

PS1='\[\e[1;36m\][\h \w]\$\[\e[m\] '

if [ -r /etc/profile.d/vte.sh ]; then
    source /etc/profile.d/vte.sh
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100
export HISTFILESIZE=1000
shopt -s histappend

#export CC=clang
#export CXX=clang++

export VISUAL=nvim
export EDITOR="${VISUAL}"

if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias cf='clang-format -i -style=file'
alias cls='clear'
alias diff='diff -u'
alias ghidra="/opt/ghidra/ghidra"
alias grep='grep --color=auto -I'
alias gs='git status'
alias ls='ls --color=auto --group-directories-first --file-type'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

complete -cf sudo
stty -ixon

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM

export DEBFULLNAME="Tim Crawford"
export DEBEMAIL="tcrawford@system76.com"
