# Aliases
alias sudo="sudo -E "
alias l="ls -lahFv"
alias cp="cp -iav"
alias mv="mv -iv"
alias rm="rm -iv"
alias vi="vim"
alias v="vim"
alias view="vim -R"
alias vw="vim -R"
alias b="cd-bookmark"
alias eman="LANG=C man"


# Global aliases
alias -g @l="| less"
alias -g @g="| grep"
alias -g @x="| xargs"


# Suffix aliases
alias -s {txt,cnf}="vim"
alias -s log="view"
alias -s pl="perl"
alias -s php="php"
alias -s py="python"

if [ -x "$(which aunpack 2>/dev/null)" ]; then
    alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}="aunpack"
fi

function runcc() { cc -O2 $1 && shift && ./a.out $@ }
function runc++() { c++ -O2 $1 && shift && ./a.out $@ }
alias -s c="runcc"
alias -s {cc,cp,cpp,cxx}="runc++"

