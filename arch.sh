#! /bin/sh
echo this script need root user and before we start edit pacman.conf file

sudo vim /etc/pacman.conf

echo Installing base apps
sudo pacman -Syu mc vifm git gcc python3 xorg mate mate-extra lightdm krita kdenlive soundkonverter \
    blender obs-studio firefox python-pip cmake fakeroot youtube-dl\
    go mpv unrar unzip libreoffice htop nvtop mypaint fpc fish ffmpeg wget\
    pkg-config zip unzip unrar youtube-dl mono\
    nvidia nvidia-dkms nvidia-lts nvidia-prime nvidia-settings nvidia-utils opencl-nvidia


echo Installing nvidia-drivers

echo insalling yay
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

echo installing aur apps
yay -S opera discord lutris pamac-yay 
yay -S simplenote typora chromium zoom wps-office mate-themes-extras pascalabcnet vmware-workstation

echo smol setup...
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
