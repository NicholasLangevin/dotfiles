export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=".:/usr/local/bin:/usr/local/sbin:$PATH"
alias ls='ls -FG'
alias tmux='tmux -2'
alias GitHub='open $(git config remote.origin.url)'
alias G='cd ~/GitHub/'
alias V='cd ~/.vim/vimrc'
alias M='cd ~/MydotFiles/'
alias H='cd ~/'
alias vifm='vifm ~/GitHub'
alias gs='git status'
function dotfiles {
    /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}
# alias use in my windows-sublinux machine
if [[ $(uname -n) -eq "PC-Nicholas" ]]; then
    alias nicholas="cd /mnt/c/Users/Nicholas"
fi

# Enable vim inside bash
set -o vi
# Need bash > 4.3
# bind 'set show-mode-in-prompt on' 

# Test is command exit (TODO: for installation scipt)
# type -P command1 &>/dev/null && echo "Found" || echo "Not Found"
EDITOR=vim
LANG=en_US.UTF-8 

#=========== Git Configuration ===============

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
    else
        echo ""
    fi
}

# Show repo & git status
export PS1="\[\e[0m\]\W\[\e[m\]\[\e[31m\]\`parse_git_branch\`\[\e[m\]\\$ "

function Google {
    # Open google research in Chrome
    search="$*"
    open -a "Google Chrome" "http://google.com/search?q=$search"
}

function Chrome {
    # Open a file in Chrome
    open -a "Google Chrome" "$1"
}

function compile {
    ~/MydotFiles/InfinyCompiler.sh $1
}

function todo {
    ~/todo.sh $*
}

function pdf {
    ~/GitHub/termpdf.py/termpdf.py $*
}
source ~/.bash_completion/alacritty
