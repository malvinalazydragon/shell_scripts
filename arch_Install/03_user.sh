#! /bin/sh

echo this script need root user and before we start edit pacman.conf file

sudo vim /etc/pacman.conf

echo Installing base apps
sudo pacman -Syu
sudo pacman -S mc vifm tmux lutris git gcc python3 xorg plasma kate konsole \
sddm krita kdenlive soundkonverter blender obs-studio python-pip cmake lsof \
fakeroot youtube-dl dolphin go mpv unrar libreoffice htop nvtop kolourpaint fish \
ffmpeg wget pkg-config zip unzip unrar youtube-dl mono opera discord patch \
okular spectacle gwenview xclip transmission-qt bluez-utils imagemagick ntfs-3g neofetch\
kamoso pulseaudio-bluetooth zathura xdotool python-kivy python-pygame|| exit

sudo pacman -S wine || exit
sudo pacman -S winetricks wine-gecko wine-mono || exit
sudo pacman -S steam || exit

echo insalling yay
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si && cd ../ && rm -rfv yay-git || exit

echo installing aur apps
cd
yay -S simplenote typora waterfox-g3-bin chromium zoom\
pascalabcnet magicavoxel downgrade python-kivymd \
|| exit

echo downgrading wine
doas downgrade wine

echo fish install
chsh marina

echo smol setup...
sudo systemctl enable sddm
sudo systemctl start sddm
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManageer
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

echo and now, ./04_epilog.sh
