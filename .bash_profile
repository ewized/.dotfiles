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
