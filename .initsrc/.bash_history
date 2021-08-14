ls
exit
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock -systohc
hwclock -systoch
hwclock --systohc
vim /etc/systemd/timesyncd.conf 
timedatectl set-timezone UTC
vim /etc/locale.gen 
localegen
local-gen
locale
locale-gen
vim /etc/locale.conf
clear
vim /etc/hostname
vim /etc/hosts
systemctl enable iwd
systemctl enable systemd-resolved.service
systemctl enable dhcpcd
passwd
iwctl
pacman -S grub efibootmgr
exit
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
ls /efi
cd /efi/EFI/
ls
cd ..
ls
cp Microsoft/ EFI/ -r
ls
cd EFI
ls
cd ..
ls
cd Boot/ EFI/ -r
cp Boot/ EFI/ -r
cd EFI/
ls
cd ..
ls
rm -rf Boot/ Microsoft/
cd ..
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
exit
useradd sinow
mkdir /home/sinow
cp /etc/keyutils/
cd /etc/keyutils/
ls
cd ..
cd /
vim /etc/pacman.conf 
ls
clear
iwctl
pamcan -Sy
pacman -Sy
pacman -S mesa vulkan-intel xf86-video-intel
pacman -S xorg-server xorg-xrdb sddm i3-gaps perl-anyevent-i3
pacman -S xfce4-terminal
pacman -S polybar picom xorg-xrandr xorg-xbacklight nitrogen thunar polkit-gnome ntfs-3g fuse gvfs
pacman -S mlocate ranger python-pdftotext viewnior volumeicon alsa alsa-utils
pacman -Syyu
pacman -S mlocate ranger python-pdftotext viewnior volumeicon alsa alsa-utils
pacman -S mousepad typora lxappearance-gtk3
pacman -S zathura zathura-pdf-mupdf zathura-djvu
pacman -S rofi dunst clipit network-manager network-manager-applet
pacman -S rofi dunst clipit network-manager-applet
yay
pacman -S dh-client flameshot openssh tar zip unzip unrar xarchiver xfce4-power-manager
pacman -S dhclient flameshot openssh tar zip unzip unrar xarchiver xfce4-power-manager
pacman -S noto-fonts-emoji noto-fonts-emoji-blob
pacman -S yay
pacman -S fcitx fcitx-qt5 fcitx-configtool
passwd sinow
su sinow
chown -R sinow:sinow /home/sinow
su sinow
shutdown now
systemctl start sddm
ll
ls -l
ls -al
cd .config/
ls
cp -r albert /home/sinow/.config/
cp -r rofi /home/sinow/.config/
cp -r i3 /home/sinow/.config/
cp -r ibus /home/sinow/.config/
cp -r clipit /home/sinow/.config/
cp -r sogoupinyin/ /home/sinow/.config/
cp -r coc /home/sinow/.config/
cp -r Code/ /home/sinow/.config/
cp -r themes/ /home/sinow/.config/
cp -r dconf/ /home/sinow/.config/
cp -r Thunar/ /home/sinow/.config/
cp -r dunst  /home/sinow/.config/
cp -r morc_menu/  /home/sinow/.config/
cp -r Mousepad/  /home/sinow/.config/
cp -r Typora  /home/sinow/.config/
cp -r fcitx /home/sinow/.config/
cp -r flameshot/ /home/sinow/.config/
cp -r nitrogen/ /home/sinow/.config/
cp -r picom.conf /home/sinow/.config/
cp -r fontconfig/ /home/sinow/.config/
cp -r volumeicon/ /home/sinow/.config/
cp -r polybar/ /home/sinow/.config/
cp -r gcolor3/ /home/sinow/.config/
cp -r gconf/ /home/sinow/.config/
cp -r xfce4/ /home/sinow/.config/
cp -r zathura/ /home/sinow/.config/
cp -r Zeal/ /home/sinow/.config/
cp -r ranger /home/sinow/.config/
cp -r gtk* /home/sinow/.config/
exit
cp -r .ssh /home/sinow/
cp -r .sogouinput/ /home/sinow/
cp -r .screenlayout/ /home/sinow/
cp -r .initsrc/ /home/sinow/
cp -r .git /home/sinow/
cp -r .dosbox/ /home/sinow/
cd .local/share/
ls
cp fonts/ /home/sinow/.local/share/
cp -r fonts/ /home/sinow/.local/share/
cp -r ranger /home/sinow/.local/share/
cp -r Zeal/ /home/sinow/.local/share/
cp -r sddm/ /home/sinow/.local/share/
cp -r ranger/ /home/sinow/.local/share/
cp -r Mousepad/ /home/sinow/.local/share/
cp -r clipit/ /home/sinow/.local/share/
cd ..
ls
cd 
cd -
cd ..
ls
cd ..
ls
mkdir basic_sinow
cp -r /home/sinow basic_sinow/
exit
cd usr/
ls
cd share/
ls
cp themes /usr/share/
cp themes /usr/share/ -r
chown -R sinow:sinow /home/sinow/
exit
pacman -S ttf-roboto noto-fonts ttf-dejavu
exit
pacman -S ttf-roboto noto-fonts ttf-dejavu
env
exit
pacman -S ttf-roboto noto-fonts ttf-dejavu
env
unset http_proxy
unset https_proxy
pacman -S ttf-roboto noto-fonts ttf-dejavu
pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
exit
systemctl restart sddm
cd ..
cd sinow/
ls
cd .initsrc/
ls
tar -xvf overwall.tar 
cd overwall
ls
ll
ls -l
cp clash /usr/bin/
mkdir /etc/clash
cp config.yaml /etc/clash/
cp Country.mmdb /etc/clash/
cp clash.service /etc/systemd/system/
systemctl start clash
systemctl enable clash
systemctl status clash
reboot
systemctl start sddm
pacman -S google-chrome-stable
pacman -S google-chrome
cp -r X11/ /etc/
cp -r NetworkManager /etc/
cp asound.conf /etc/
chmod +x /usr/bin/clash 
systemctl start clash
systemctl status clash
systemctl status sddm
systemctl enable sddm
reboot
exit
cd
ls
la
ls -a
cat .bash_history |wc
vim .bash_history 
exit
mv RenzheCloud\ \(2\).txt /etc/clash/config.yaml 
systemctl restart clash
systemctl status clahs
systemctl status clsh
systemctl status clash
systemctl stop clash
systemctl status clash
systemctl status clash
pacman -Ss man
pacman -S man
systemctl status clash
pacman -Ss skypeforlinux
pacman -S skypeforlinux-stable-bin
exit
