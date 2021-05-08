#! /bin/bash
while true
do
    lastlg=$(setxkbmap -query | grep layout | cut -c13)    
    sleep 0.04s
    newlg=$(setxkbmap -query | grep layout | cut -c13)
    if [[ $lastlg != $newlg ]]
    then
        tmux refresh-client -S
    fi
done
