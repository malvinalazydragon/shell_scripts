# /bin/bash

lang=$(setxkbmap -query | grep layout | cut -c13)

if [ $lang == 'r' ]
then
    echo 1
else
    echo 0
fi
