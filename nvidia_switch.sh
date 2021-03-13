#! /bin/bash

black="/etc/modprobe.d/blacklist.conf"

if [ $(whoami) == 'root' ]
then
    case $1 in
        "--off")
            echo "install nvidia_drm /bin/false" > $black
            echo "install nvidia_modeset /bin/false" >> $black
            echo "install nvidia /bin/false" >> $black
        ;;
    
        "--on")
            echo > $black
            modprobe nvidia_drm
            modprobe nvidia_modeset
            modprobe nvidia
        ;;
    
    esac
        echo "System should restart, do you wish to do now? [y/n]"
        read -p ": " choose
        if [ $choose == 'y' ]
        then
            shutdown -r now
        else
            exit
        fi
else
    echo Permission Denied
fi
