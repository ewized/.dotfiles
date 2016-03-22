# Get the git status for the cli
function git-branch-prompt {
  local branch=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`
  if [ $branch ]; then printf " [%s]" $branch; fi
}

# Set the look of cli
PS1="\u@\h:\[\033[0;36m\]\W\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\]\$ "

# Kill all screens
killd () {
    for session in $(screen -ls | grep -o '[0-9]\{4\}')
    do
        screen -S "${session}" -X quit;
    done
}

# Start tmux
if [ $(hostname) == "vm1" ] && [ $(tmux ls | wc -l) -gt 0 ]
    then
        if ! [ $(tmux ls | wc -l) -gt 1 ] ; then
            tmux a
        fi
    else
        if ! [[ -n $TMUX ]] ; then
            tmux
        fi
fi
