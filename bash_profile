# .bash_profile

if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi

PATH=$PATH:/usr/share/bcc/tools
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.local/bin
export PATH
