#! /bin/bash

echo base configuration
timedatectl set-timezone Europe/Moscow || exit

vim /etc/locale.gen

locale-gen

echo Dragon-Cave > /etc/hostname

echo "127.0.0.1		localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.0.1		Dragon-Cave" >> /etc/hosts

passwd || exit

pacman -S grub efibootmgr opendoas || exit

mkdir /boot/efi

mount /dev/sda1 /boot/efi || exit

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi || exit

grub-mkconfig -o /boot/grub/grub.cfg || exit

useradd -d /home/marina marina || exit

passwd marina || exit

echo remove pcspkr
echo "blacklist pcspkr" | tee /etc/modprobe.d/nobeep.conf || exit


echo setup doas
echo permit marina > /etc/doas.conf
echo permit nopass marina as root cmd pacman >> /etc/doas.conf

echo setup sudo
echo "marina ALL=(ALL) ALL" >> /etc/sudoers

echo next step: su marina and ./user.sh
