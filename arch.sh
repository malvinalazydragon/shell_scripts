#! /bin/sh
echo this script need root user and before we start edit pacman.conf file

sudo vim /etc/pacman.conf

echo Installing base apps
sudo pacman -Syu mc tmux git gcc python3 xorg plasma kwrite spectacle krita kdenlive soundkonverter \
    blender obs-studio firefox simplescreenrecorder gwenview python-pip python-pygame kget cmake fakeroot\
    go mpv ark kcalc dolphin libreoffice okular htop nvtop mypaint steam fpc fish ffmpeg konsole wget\
    pkg-config zip unzip unrar youtube-dl mono wine wine-mono wine-gecko winetricks

echo Installing nvidia-drivers
sudo pacman -S nvidia nvidia-dkms nvidia-lts nvidia-prime nvidia-settings nvidia-utils lib32-nvidia-utils opencl-nvidia

echo insalling yay
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

echo installing aur apps
yay -S opera discord lutris pamac-yay 
yay -S simplenote typora chromium zoom wps-office pascalabcnet
