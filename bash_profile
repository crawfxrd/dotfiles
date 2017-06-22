# .bash_profile

if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi

PATH="${HOME}/.cargo/bin:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"
export PATH
