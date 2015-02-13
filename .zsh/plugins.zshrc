# plugins.zshrc
# The file of including oh-my-zsh plugins of each OS

plugins=(git cd-bookmark sudo)

if [ "${os}" = "osx" ]; then
    if [ -x "$(which brew 2>&1)" ]; then
        plugins=($plugins osx brew)
    elif [ -x "$(which port 2>&1)" ]; then
        plugins=($plugins osx macports apache2-macports)
    fi
elif [ "${os}" = "debian" ]; then
    plugins=($plugins debian)
elif [ "${os}" = "redhat" ]; then
    plugins=($plugins yum)
fi

