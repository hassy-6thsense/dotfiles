#!/bin/bash

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
		if [ -L "${HOME}/${dotfile}" ]; then
			rm -f "${HOME}/${dotfile}"
		elif [ -e "${HOME}/${dotfile}" ]; then
			echo -n "mv: "
			mv -vi "${HOME}/${dotfile}" "${HOME}/${dotfile}.orig"
		fi
		echo -n "ln: "
        ln -vis "${PWD}/${dotfile}" "${HOME}/${dotfile}"
    fi
done

# Make symbolic links to /path/to/dotfiles/gitfiles/* in $HOME. 
cd "${dotfiles_dir}/.gitfiles"
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] && [ "${dotfile}" != ".." ]; then
		if [ -L "${HOME}/${dotfile}" ]; then
			rm -f "${HOME}/${dotfile}"
		elif [ -e "${HOME}/${dotfile}" ]; then
			echo -n "mv: "
			mv -vi "${HOME}/${dotfile}" "${HOME}/${dotfile}.orig"
		fi
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
		if [ -L "${omz_custom_dir}/${file}" ]; then
			rm -f "${omz_custom_dir}/${file}"
		elif [ -e "${omz_custom_dir}/${file}" ]; then
			echo -n "mv: "
			mv -vi "${omz_custom_dir}/${file}" "${omz_custom_dir}/${file}.orig"
		fi
		echo -n "ln: "
        ln -vis "${PWD}/${file}" "${omz_custom_dir}/${file}"
	else 
		cd "${PWD}/plugins"
		for plugin in ?*
		do
			if [ -L "${omz_custom_dir}/${plugin}" ]; then
				rm -f "${omz_custom_plugins_dir}/${plugin}"
			elif [ -e "${omz_custom_plugins_dir}/${plugin}" ]; then
				echo -n "mv: "
				mv -vi "${omz_custom_plugins_dir}/${plugin}" "${omz_custom_plugins_dir}/${plugin}.orig"
			fi
			echo -n "ln: "
        	ln -vis "${PWD}/${plugin}" "${omz_custom_plugins_dir}/${plugin}"
		done
	fi
done

