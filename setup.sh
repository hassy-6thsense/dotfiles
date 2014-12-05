#!/bin/sh

# Initialize and update submodules.
git submodule init
git submodule update

# Make symbolic links to /path/to/dotfiles/* in $HOME. 
cd "$(dirname $0)"
echo $PWD
for dotfile in .?*
do
    if [ "${dotfile}" != "." ] &&
		[ "${dotfile}" != ".." ] &&
		[ "${dotfile}" != ".git" ] &&
		[ "${dotfile}" != ".gitignore" ] &&
		[ "${dotfile}" != ".gitmodules" ]; then
		if [ -e "${HOME}/${dotfile}" ]; then
			rm -ir "${HOME}/${dotfile}"
		fi
        ln -vFis "${PWD}/${dotfile}" "${HOME}"
    fi
done

# Make symbolic links to $HOME/.zsh/.om-my-zsh/custom/* in /path/to/oh-my-zsh/custom/* 
cd "${PWD}/.zsh/.oh-my-zsh/custom"
echo $PWD
for file in ?*
do
    if [ "${file}" != "plugins" ]; then
		if [ -e "${HOME}/.oh-my-zsh/custom/${file}" ]; then
			rm -ir "${HOME}/.oh-my-zsh/custom/${file}"
		fi
        ln -vFis "${PWD}/${file}" "${HOME}/.oh-my-zsh/custom/${file}"
	else 
		cd "${PWD}/plugins"
		echo $PWD
		for plugin in ?*
		do
			if [ -e "${HOME}/.oh-my-zsh/custom/plugins/${plugin}" ]; then
				rm -ir "${HOME}/.oh-my-zsh/custom/plugins/${plugin}"
			fi
        	ln -vFis "${PWD}/${plugin}" "${HOME}/.oh-my-zsh/custom/plugins/${plugin}"
		done
	fi
done

