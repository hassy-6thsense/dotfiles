# os.zshrc
# The file of including the configuration file of each OS

if [ "$(uname)" = "Darwin" ]; then
    source "$HOME/.zsh/osx.zshrc"
elif [ -f "/etc/debian_version" ]; then
    source "$HOME/.zsh/debian.zshrc"
elif [ -f "/etc/redhat-release" ]; then
    source "$HOME/.zsh/redhat.zshrc"
fi

