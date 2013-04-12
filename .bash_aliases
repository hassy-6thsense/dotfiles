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

# upコマンド
if [ -f "/etc/debian_version" ]; then
	alias up='sudo apt-get update && sudo apt-get upgrade'
elif [ -f "/etc/redhat-version" ]; then
	alias up='sudo yum update'
elif [ `uname -s` = "SunOS" ]; then
	if [ `uname -r` = "5.11" ]; then
		alias up='sudo pkg update'
	else
		if [ -f `which pkgutil` ]; then
			alias up='sudo pkgutil -U && sudo pkgutil -u'
		fi
	fi
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
fi

# depend on username aliases
source $HOME/.bash_own

# ssh aliases
source $HOME/.bash_ssh

