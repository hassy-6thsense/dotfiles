#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ ${dotfile} != "." ] && [ ${dotfile} != ".." ] && [ ${dotfile} != ".git" ] && [ ${dotfile} != ".gitignore" ]; then
		if [ -e ${HOME}/${dotfile} ]; then
			rm -ir "${HOME}/${dotfile}"
		fi
        ln -vFis "${PWD}/${dotfile}" ${HOME}
    fi
done

