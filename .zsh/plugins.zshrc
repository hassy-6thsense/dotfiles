# plugins.zshrc
# The file including oh-my-zsh plugins for each environment


# local function
# $1 = plugin name
# $2 = application's binary
function include_if_exist() {
    if [ -x "$(which $2 2>/dev/null)" ]; then
        plugins=(${plugins} $1)
    fi
}


# For all environment
plugins=(git cd-bookmark)


# For each OS
if [ "${os}" = "osx" ]; then
    plugins=($plugins osx)
    include_if_exist "brew" "brew"
    include_if_exist "macports apache2-macports" "port"
elif [ "${os}" = "debian" ]; then
    plugins=($plugins debian)
elif [ "${os}" = "redhat" ]; then
    plugins=($plugins yum)
fi


# For each application that is installed

# sudo
include_if_exist "sudo" "sudo"

# systemd
include_if_exist "systemd" "systemctl"


unfunction include_if_exist
