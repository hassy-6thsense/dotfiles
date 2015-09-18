#!/bin/bash

function divert_file() {
    if [ -L "${1}" ]; then
        rm -f "${1}"
    elif [ -e "${1}" ]; then
        echo -n "mv: "
        mv -vi "${1}" "${1}.orig"
    fi
}

function make_symlink() {
    divert_file "${2}"
    echo -n "ln: "
    ln -vis "${1}" "${2}"
}


# Set current directory at the start of executing this shell
current_dir="${PWD}"

# Set directory 'dotfiles' if exists
dotfiles_dir="${HOME}/dotfiles"
if [ ! -d ${dotfiles_dir} ]; then
    echo "dotfiles MUST be installed "${HOME}/dotfiles" !"
    exit 1;
fi

# Initialize and update submodules
git submodule init
git submodule update

# Make symbolic links to /path/to/dotfiles/* in $HOME
cd "${dotfiles_dir}"
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] &&
       [ "${dotfile}" != ".." ] &&
       [ "${dotfile}" != ".git" ] &&
       [ "${dotfile}" != ".gitfiles" ] &&
       [ "${dotfile}" != ".gitignore" ] &&
       [ "${dotfile}" != ".gitmodules" ]; then
        make_symlink "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to /path/to/dotfiles/gitfiles/* in $HOME
cd "${dotfiles_dir}/.gitfiles"
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] && [ "${dotfile}" != ".." ]; then
        make_symlink "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to $HOME/.zsh/.om-my-zsh/custom/* in /path/to/oh-my-zsh/custom/*
omz_custom_dir="${HOME}/.oh-my-zsh/custom"
omz_custom_plugins_dir="${HOME}/.oh-my-zsh/custom/plugins"

cd "${dotfiles_dir}/.zsh/.oh-my-zsh/custom"
for file in ?*
do
    if [ "${file}" != "plugins" ]; then
        make_symlink "${PWD}/${file}" "${omz_custom_dir}/${file}"
    else
        cd "${PWD}/plugins"
        for plugin in ?*
        do
            make_symlink "${PWD}/${plugin}" "${omz_custom_plugins_dir}/${plugin}"
        done
    fi
done

# Return to current directory at the start of executing this shell
cd ${current_dir}

# Reload shell
exec ${SHELL}
