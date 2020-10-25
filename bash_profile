# .bash_profile

if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi

PATH=/usr/share/bcc/tools:$PATH
PATH=/opt/wine-staging/bin:$PATH
PATH=/usr/libexec/sdcc/:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/.local/bin:$PATH
export PATH
