#!/bin/bash

dotfiles_dir="$(dirname $(readlink -f $0))"

function divert_file() {
	if [ -L "${1}" ]; then
		rm -f "${1}"
	elif [ -e "${1}" ]; then
		echo -n "mv: "
		mv -vi "${1}" "${1}.orig"
	fi
}

# Initialize and update submodules.
git submodule init
git submodule update

# Make symbolic links to /path/to/dotfiles/* in $HOME. 
cd "${dotfiles_dir}"
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] &&
	   [ "${dotfile}" != ".." ] &&
	   [ "${dotfile}" != ".git" ] &&
	   [ "${dotfile}" != ".gitfiles" ] &&
	   [ "${dotfile}" != ".gitignore" ] &&
	   [ "${dotfile}" != ".gitmodules" ]; then
		divert_file "${HOME}/${dotfile}"
		echo -n "ln: "
        ln -vis "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to /path/to/dotfiles/gitfiles/* in $HOME. 
cd "${dotfiles_dir}/.gitfiles"
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] && [ "${dotfile}" != ".." ]; then
		divert_file "${HOME}/${dotfile}"
		echo -n "ln: "
        ln -vis "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to $HOME/.zsh/.om-my-zsh/custom/* in /path/to/oh-my-zsh/custom/*
omz_custom_dir="${HOME}/.oh-my-zsh/custom"
omz_custom_plugins_dir="${HOME}/.oh-my-zsh/custom/plugins"

cd "${dotfiles_dir}/.zsh/.oh-my-zsh/custom"
for file in ?*
do
    if [ "${file}" != "plugins" ]; then
		divert_file "${omz_custom_dir}/${file}"
		echo -n "ln: "
        ln -vis "${PWD}/${file}" "${omz_custom_dir}/${file}"
	else 
		cd "${PWD}/plugins"
		for plugin in ?*
		do
			divert_file "${omz_custom_plugins_dir}/${plugin}"
			echo -n "ln: "
        	ln -vis "${PWD}/${plugin}" "${omz_custom_plugins_dir}/${plugin}"
		done
	fi
done

