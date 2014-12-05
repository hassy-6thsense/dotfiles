#!/bin/sh

dotfiles_dir="$(dirname $(readlink -f $0))"

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
		if [ -e "${HOME}/${dotfile}" ]; then
			rm -ir "${HOME}/${dotfile}"
		fi
        ln -vFis "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to /path/to/dotfiles/gitfiles/* in $HOME. 
cd "${dotfiles_dir}/.gitfiles"
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] && [ "${dotfile}" != ".." ]; then
		if [ -e "${HOME}/${dotfile}" ]; then
			rm -ir "${HOME}/${dotfile}"
		fi
        ln -vFis "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to $HOME/.zsh/.om-my-zsh/custom/* in /path/to/oh-my-zsh/custom/*
omz_custom_dir="${HOME}/.oh-my-zsh/custom"
omz_custom_plugins_dir="${HOME}/.oh-my-zsh/custom/plugins"

cd "${dotfiles_dir}/.zsh/.oh-my-zsh/custom"
for file in ?*
do
    if [ "${file}" != "plugins" ]; then
		if [ -e "${omz_custom_dir}/${file}" ]; then
			rm -ir "${omz_custom_dir}/${file}"
		fi
        ln -vFis "${PWD}/${file}" "${omz_custom_dir}/${file}"
	else 
		cd "${PWD}/plugins"
		for plugin in ?*
		do
			if [ -e "${omz_custom_plugins_dir}/${plugin}" ]; then
				rm -ir "${omz_custom_plugins_dir}/${plugin}"
			fi
        	ln -vFis "${PWD}/${plugin}" "${omz_custom_plugins_dir}/${plugin}"
		done
	fi
done

