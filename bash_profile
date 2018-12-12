# .bash_profile

if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi

PATH=$PATH:/usr/share/bcc/tools
PATH=$PATH:$HOME/.cargo/bin
PATH=$HOME/.local/bin:$PATH
export PATH
