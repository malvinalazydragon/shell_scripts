#! /bin/bash

doas pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings cuda
doas -S bumblebee lib32-nvidia-utils primus-vk lib32-primus_vk
