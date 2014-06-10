
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#added by YG



alias sls='clear; ls'
LSCOLORS="DxGxFxdxCxdxdxhbadExEx"
export LSCOLORS

# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."
# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES=""
# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE=""
# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM=""

# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# NORMAL=$(tput sgr0)

BLACK='\[\e[0;30m\]'
DARKGRAY='\[\e[1;30m\]'
RED='\[\e[0;31m\]'
LIGHTRED='\[\e[1;31m\]'
GREEN='\[\e[0;32m\]'
LIGHTGREEN='\[\e[1;32m\]'
BROWN='\[\e[0;33\]'
YELLOW='\[\e[1;33\]'
BLUE='\[\e[0;34m\]'
LIGHTBLUE='\[\e[1;34m\]'
PURPLE='\[\e[0;35m\]'
LIGHTPURPLE='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
LIGHTGRAY='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'

# get branch info from GIT
function set_git {
    BRANCH=`__git_ps1`
    ABRANCH=`__git_ps1 "%s"`
    if [[ -z $BRANCH ]]; then
echo "$(tput setaf 1)"
    else
if [[ "$BRANCH" == *"*"* ]]; then
echo "$(tput setaf 1)${ABRANCH%%??}"
        else
echo "$(tput setaf 2)${ABRANCH}"
        fi
fi
}

# create horizontal line that fills the middle of the terminal with dynamic width
function horizline {
    TERMWIDTH=${COLUMNS}
    let promptsize=$(echo -n "-[\u]-[\h]-[${PWD}:]`set_git`-" | wc -c | tr -d " ")
    let fillsize=${TERMWIDTH}-${promptsize}+7
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
fill="${fill}-"
        let fillsize=${fillsize}-1
    done
echo ${fill}
}

PROMPT1="$LIGHTPURPLE-[$LIGHTPURPLE ON AIR$LIGHTPURPLE]-[$LIGHTPURPLE\h$LIGHTPURPLE]-[$LIGHTPURPLE\w:$LIGHTPURPLE]"
PROMPT2="$LIGHTPURPLE]-"
PS1="$PROMPT1"'`horizline`[`set_git`'"$PROMPT2\n-$LIGHTGRAY$ "

#end added by YG
