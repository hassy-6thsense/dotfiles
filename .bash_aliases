# aliases
alias sudo='sudo '
alias l='ls -lAFh'
alias c='cd'
alias vim='vim -u $HOME/.vimrc'
alias view='view -u $HOME/.vimrc'
alias v='vim'
alias vi='vim'
alias vw='view'
alias cl='clear'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

alias vbashrc='vim $HOME/.bashrc'
alias vbash_aliases='vim $HOME/.bash_aliases'
alias vvimrc='vim $HOME/.vimrc'

function gitpull()
{
	if ! [ -d "./.git" ]; then
		echo "$PWD is not git directory."
	else
		if [ $# -eq 0 ]; then
			git pull origin master
		elif [ $# -eq 1 ] && [ -n "$1" ]; then
			git pull $1 master
		elif [ $# -eq 2 ] && [ -n "$1" ] && [ -n "$2" ]; then
			git pull $1 $2
		else
			echo "usage: gitpull [<repository> [<refspec>]]"
		fi
	fi
}

function gitpush()
{
	if ! [ -d "./.git" ]; then
		echo "$PWD is not git directory."

	else
		if [ $# -eq 1 ] && [ -n "$1" ]; then
			gitpull
			git add .
			git commit -am "$1"
			git push origin master
		elif [ $# -eq 2 ] && [ -n "$1" ] && [ -n "$2" ]; then
			gitpull $2
			git add .
			git commit -m "$1"
			git push $2 master
		elif [ $# -eq 3 ] && [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ]; then
			gitpull $2 $3
			git add .
			git commit -m "$1"
			git push $2 $3
		else
			echo "usage: gitpush <comment> [<repository> [<refspec>]]"
		fi
	fi
}


# upコマンド
if [ -f "/etc/debian_version" ]; then
	alias up='sudo apt-get update && sudo apt-get upgrade'
elif [ -f "/etc/redhat-version" ]; then
	alias up='sudo yum update'
elif [ $(uname -s) = "SunOS" ]; then
	if [ $(uname -r) = "5.11" ]; then
		alias up='sudo pkg update'
	else
		if [ -f $(which pkgutil) ]; then
			alias up='sudo pkgutil -U && sudo pkgutil -u'
		fi
	fi
elif [ -f $(which port 2>/dev/null) ]; then
	alias up='sudo port selfupdate && sudo port upgrade outdated'
else
	unalias up 2>/dev/null
fi

if [ -e "$HOME/.bash" ]; then
	rcfiles=(`ls -a $HOME/.bash`)
	for rcfile in ${rcfiles[@]}
	do
		if [ $rcfile != "." ] && [ $rcfile != ".." ]; then
			source $HOME/.bash/$rcfile
		fi
	done
	unset rcfile
	unset rcfiles
fi

# depend on username aliases
if [ -f "$HOME/.bash_own" ]; then
	source $HOME/.bash_own
fi

# ssh aliases
if [ -f "$HOME/.bash_ssh" ]; then
	source $HOME/.bash_ssh
fi

