#! /bin/bash

touch_id=$(xinput | grep Synaptics)
touch=${touch_id:28:24}
tch=$(echo `expr substr $touch 4 2`)

if [ "$1" = "off" ]
then
    xinput set-prop $tch "Device Enabled" 0
fi
if [ "$1" = "on" ]
then
    xinput set-prop $tch "Device Enabled" 1
fi
