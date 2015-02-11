# Additional plugins of oh-my-zsh
plugins=($plugins osx gnu-utils)

if [ -x "$(which brew 2>&1)" ]; then
    plugins=($plugins brew)
elif [ -x "$(which port 2>&1)" ]; then
    plugins=($plugins macports apache2-macports)
fi

# environments
export JAVA_HOME="$(/usr/libexec/java_home)"

