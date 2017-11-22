## Set up color for the PS1 prompt
## Text color variables
if [ -z "$PS1" ]; then
return
else
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;95m\]"
CYAN="\[\033[0;36m\]"
LGRAY="\[\033[0;37m\]"
DGRAY="\[\033[0;90m\]"
LRED="\[\033[0;91m\]"
LGREEN="\[\033[0;92m\]"
LYELLOW="\[\033[0;93m\]"
LBLUE="\[\033[0;94m\]"
LMAGENTA="\[\033[0;95m\]"
LCYAN="\[\033[0;96m\]"
WHITE="\[\033[0;97m\]"
RESET="\[\033[0m\]"
BOLD="\[\033[1m\]"
fi

## Set up the prompt, nice colors and git integration (see functions at end of file)
# export CLICOLOR=1
export PS1="${RED}[${YELLOW}\u${GREEN}@${BLUE}\h ${MAGENTA}\W${RED}]\[\$(git_color)\]\$(git_branch)${WHITE}$ ${RESET}"

## General settings
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s autocd

## My own aliases
# alias sshalok="ssh -R 52698:localhost:52698 -L 8888:localhost:8888 johnlamb@alok.scilifelab.se"
alias sshalok="ssh johnlamb@alok.scilifelab.se -t tmux a"
alias ls="gls --color=auto"
test -r ~/.dircolors && eval "$(gdircolors ~/.dircolors)"
test -r ~/.virtualenvs && export WORKON_HOME=~/.virtualenvs && source /usr/local/bin/virtualenvwrapper.sh

## base16 helper functions
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
## Special functions, git integrations for PS1
function git_branch () {
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
        echo -e "\033[0;31m"
    else
    if [[ "$STATUS" == *'Your branch is ahead'* ]]
        then
        # yellow if need to push
        echo -e "\033[0;33m"
   else
        # else cyan
        echo -e "\033[0;32m"
    fi
    fi
    fi
}
