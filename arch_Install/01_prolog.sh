#! /bin/bash

echo Internet setup
rmmod pcspkr
iwctl || exit

echo -ne "\n\nFormatting dev's"
mkfs.fat -F32 /dev/sda1 || exit
mkswap /dev/sda2
mkfs.ext4 /dev/sda3 || exit

echo Base installing
mount /dev/sda3 /mnt
pacstrap /mnt base base-devel linux linux-firmware vim || exit

echo Making fstab
mount /dev/sda4 /mnt/home/
genfstab -U /mnt >> /mnt/etc/fstab || exit

echo Good Luck! now you need to run root.sh
arch-chroot /mnt
