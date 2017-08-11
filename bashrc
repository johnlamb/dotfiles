export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
alias ls="ls -G"
export CLICOLOR=1
export TERM=xterm-256color
 #export PS1='\e[0;32m\h: \e[m\e[0;33m\w\e[m\n\$ '
alias ipython="jupyter console"
alias sshalok="ssh -R 52698:localhost:52698 -L 8888:localhost:8888 johnlamb@alok.scilifelab.se"
alias crep="grep --color=always"
getgit() { git clone http://github.com/$1.git ;}
note() { echo "$@" >> ~/notes ;}
git_branch () {
    if git rev-parse --git-dir >/dev/null 2>&1
        then echo -e "" [$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')]
    else
        echo ""
    fi
}
function git_color {
    local STATUS=`git status 2>&1`
    if [[ "$STATUS" == *'Not a git repository'* ]]
        then echo ""
    else
    if [[ "$STATUS" != *'working tree clean'* ]] && [[ "$STATUS" != *'working directory clean'* ]]
        then
        # red if need to commit
        echo -e '\033[0;31m'
    else
    if [[ "$STATUS" == *'Your branch is ahead'* ]]
        then
        # yellow if need to push
        echo -e '\033[0;33m'
    else
        # else cyan
        echo -e '\033[0;32m'
    fi
    fi
    fi
}
#export PS1='\[\033[0;34m\]\W/\[$(git_color)\]$(git_branch)\[\033[m\] \[\033[0;35m\]:\[\033[m\] '
export PS1='\[$(tput bold)\]\e[0;31m[\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(git_color)\]$(git_branch)\[\033[m\]\e[0;33m\\$ \[$(tput sgr0)\]'
#export PS1='\[$(git_color)\]$(git_branch)\[\033[m\]' 
set editing-mode vi
set keymap vi-command

# export PS1='\e[0;32m\h: \e[m\e[0;33m\w\e[m\n\$ '

