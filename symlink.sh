#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != ".." ] && [ $dotfile != ".git" ] && [ $dotfile != "README.md" ] && [ $dotfile != ".gitignore" ]; then
		if [ -e $dotfile ]; then
			rm -ir "$HOME/$dotfile"
		fi
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

