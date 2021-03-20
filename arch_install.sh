#! /bin/bash

echo Internet setup
rmmod pcspkr
iwctl

echo -ne "\n\nFormatting dev's"
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
swapon

echo Base installing
mount /dev/sda3 /mnt
pacman -Syy
pacstrap /mnt base base-devel linux linux-firmware vim mc tmux lutris git gcc python3 xorg plasma kate konsole \
sddm krita kdenlive soundkonverter blender obs-studio python-pip cmake lsof \
fakeroot youtube-dl dolphin go mpv unrar libreoffice htop nvtop kolourpaint \
ffmpeg wget pkg-config zip unzip unrar youtube-dl mono opera discord patch \
okular spectacle gwenview xclip transmission-qt bluez-utils imagemagick ntfs-3g neofetch\
kamoso pulseaudio pulseaudio-bluetooth zathura xdotool\
links ninja thunderbird grub efibootmgr opendoas

pacstrap /mnt wine-staging
pacstrap /mnt winetricks wine-gecko wine-mono
pacstrap /mnt steam
pacstrap /mnt nvidia nvidia-utils lib32-nvidia-utils nvidia-settings cuda

echo Making fstab
mount /dev/sda4 /mnt/home/
genfstab -U /mnt >> /mnt/etc/fstab

echo base configuration
arch-chroot /mnt timedatectl set-timezone Europe/Moscow
vim /mnt/etc/locale.gen
arch-chroot /mnt locale-gen

echo Dragon-Cave > /mnt/etc/hostname

echo "127.0.0.1		localhost" >> /mnt/etc/hosts
echo "::1		    localhost" >> /mnt/etc/hosts
echo "127.0.0.1		Dragon-Cave" >> /mnt/etc/hosts

arch-chroot /mnt passwd

echo grub installing
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
arch-chroot /mnt grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

echo Adding user
arch-chroot /mnt useradd -d /home/marina marina
arch-chroot /mnt passwd marina

echo remove pcspkr
echo 'blacklist pcspkr' | tee /mnt/etc/modprobe.d/nobeep.conf

echo setup doas
arch-chroot /mnt echo permit marina > /etc/doas.conf
arch-chroot /mnt echo permit nopass marina as root cmd pacman >> /etc/doas.conf
arch-chroot /mnt echo permit nopass marina as root cmd downgrade >> /etc/doas.conf
arch-chroot /mnt echo permit nopass marina as root cmd mctlauncher >> /etc/doas.conf

echo setup sudo
arch-chroot /mnt echo "marina ALL=(ALL) ALL" >> /etc/sudoers

echo Setup pacman
arch-chroot /mnt vim /etc/pacman.conf

echo insalling yay
arch-chroot /mnt su marina -c $(cd /home/marina; \
    git clone https://aur.archlinux.org/yay-git.git;\
    cd yay-git; makepkg -si && cd ../ && rm -rfv yay-git)

echo installing aur apps
arch-chroot /mnt su marina -c $(yay -S simplenote typora waterfox-g3-bin chromium zoom\
    magicavoxel downgrade ponysay mctlauncher)

echo smol setup...
arch-chroot /mnt systemctl enable sddm
arch-chroot /mnt systemctl start sddm
arch-chroot /mnt systemctl enable NetworkManager
arch-chroot /mnt systemctl start NetworkManageer
arch-chroot /mnt systemctl enable bluetooth
arch-chroot /mnt systemctl start bluetooth

echo Done, unmounting all filesystems
umount /mnt/boot/efi
umount /mnt/home
umount /mnt

echo You should restart pc
