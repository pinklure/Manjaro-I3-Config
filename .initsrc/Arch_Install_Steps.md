### git 仓库

- git
  - https://github.com/SinowX/Manjaro-I3-Config
- gitee
  - null









- 软件
- 输入法配置
- polybar
- 时间
- 镜像源
- 中文输入法
- 主题













### 基础安装

1. 联网 (wifi)

   - iwctl 进入iwd命令行
   - device list
   - station xxx scan
   - station xxx get-networks
   - station xxx connect xxx
   - exit
   - dhcpcd 动态分配ip
   - ping www.baidu.com

2. 格式化分区

   - fdisk -l
   - fdisk /dev/sda
   - 一个 EFI 分区 mkfs.fat -F 32 /dev/sda1
   - 一个 swap 分区 mkswap /dev/sda2
     - swapon /dev/sda2 之后交换空间信息会由fstab传递给新系统
   - 一个 root 分区 mkfs.ext4 /dev/sda3
   - 一个 home 分区 mkfs.ext4 /dev/sda4

3. 挂载分区

   - mount /dev/sda3 /mnt
   - /mnt --> /dev/sda3
     - /mnt/home --> /dev/sda4
     - /mnt/efi --> /dev/sda1

4. 更换国内镜像源 （忘记会不会将源配置传到新系统）

   - /etc/pacman.d/mirrorlist
     - 阿里源
       - Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch
     - 清华源
       - Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
   - - 

5. 安装基础软件包

   - pacstrap /mnt base linux linux-firmware vim iwd dhcpcd

6. fstab 生成关于磁盘信息

   - genfstab -U /mnt >> /mnt/etc/fstab

7. chroot 进入新系统

   - arch-chroot /mnt

8. 设置时区（好像吧）

   - ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
   - hwclock --systohc
   - vim /etc/systemd/timesyncd.conf
     -  取消#NTP的注释
     - 改为
     - `NTP=time1.aliyun.com time2.aliyun.com time3.aliyun.com time4.aliyun.com time5.aliyun.com time6.aliyun.com time7.aliyun.com`
   - timedatectl set-timezone UTC 
   - timedatectl set-ntp true

9. 本地化

   - vim /etc/locale.gen
     - 去除 en_GB.UTF-8 或 en_SG.UTF-8 的注释
   - 生成 locale 信息
     - vim /etc/locale.conf
       - 添加 `LANG=en_GB.UTF-8`

10. 网络配置

    - vim /etc/hostname

      - 创建主机名，自定义(Arch)

    - vim /etc/hosts

      - ```
        127.0.0.1	localhost
        ::1			localhost	ip6-localhost	ip6-loopback
        127.0.1.1 	Arch.localdomain	Arch
        ff02::1		ip6-allnodes
        ff02::2		ip6-allrouters
        ```

    - `systemctl enable iwd`

    - `systemctl enable systemd-resolved.service`

    - `systemctl enable dhcpcd`

11. 设置Root密码

    - passwd

12. 安装引导

    - 单系统
      - `pacman -S grub efibootmgr`
      - `grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinux`
      - `grub-mkconfig -o /boot/grub/grub.cfg`
    - 双系统 Windows Arch
      - 将 windows 的 efi 分区
      - `cp -r /tmpmnt/EFI* /efi/EFI/`
      - `pacman -S grub efibootmgr os-prober`
      - `grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ArchLinux`
      - `grub-mkconfig -o /boot/grub/grub.cfg`

13. 关机重启

    - exit
    - reboot

    



### 安装 i3 环境

1. /etc/pacman.conf

   - [archlinuxcn]
     SigLevel = Never
     Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
   - pacman -S archlinuxcn-ekyring

2. 安装显卡驱动

   - `pacman -S mesa vulkan-intel xf86-video-intel`
   - 官方仓库提供的驱动包:
     - 通用----------------------------------xf86-video-vesa
     - intel----------------------------------xf86-video-intel
     - Geforce7±-------------------------xf86-video-nouveau
     - Geforce6/7-------------------------xf86-video-304xx

3. 安装桌面

   - ```bash
     pacman -S xorg-server // 安装 xorg
     pacman -S xorg-xrdb // 使用 .Xresources
     pacman -S sddm i3-gaps
     pacman -S perl-anyevent-i3
     ```

4. 安装字体

   - 中文字体 

   - ~/.config/fontconfig/fonts.conf 在git 中已配置好

   - ```bash
     pacman -S ttf-roboto noto-fonts ttf-dejavu
     pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
     pacman -S noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
     ```
     
   - 安装仿宋、宋、黑体、楷体

     - 文件在 windowsFonts中，将其复制到 /usr/share/fonts 下
     - 刷新字体缓存 `fc-cache /usr/share/fonts/` 或者 `fc-cache -fv`

5. 安装工具

   - ```bash
     pacman -S polybar // bar
     pacman -S picom // 透明特效
     pacman -S xorg-xrandr arandr // 分辨率
     pacman -S xorg-xbacklight // 调节亮度
     pacman -S nitrogen // 切换壁纸
     pacman -S thunar polkit-gnome ntfs-3g // 文件管理器
     pacman -S fuse gvfs //好像与文件管理器有关
     pacman -S xdg-utils //包括 xdg-open xdg-mime 等
     
     pacman -S mlocate // locate
     
     pacman -S ranger 
     
     pacman -S ueberzug // preview images
     pacman -S python-pdftotext // ranger 预览 pdf
     yay -S ttf-all-the-icons // ranger icons
     
     
     pacman -S vlc // 视频播放器
     
     pacman -S viewnior // 图片查看
     
     pacman -S volumeicon // 音量控制器
     pacman -S alsa alsa-utils
     
     
     pacman -S gnome-keyring // skype 登录状态     
     
     pacman -S typora // md 编辑器
     pacman -S mousepad // 文本编辑器
     
     pacman -S lxappearance-gtk3 // 切换主题 /usr/share/themes/
     
     pacman -S zathura zathura-pdf-mupdf zathura-djvu
     
     pacman -S rofi // 窗口切换
     pacman -S dunst // 通知管理器
     pacman -S clipit // 剪贴板
     pacman -S networkmanager network-manager-applet // 网络管理
     pacman -S dh-client 
     
     pacman -S flameshot // 截图
     pacman -S openssh 
     
     
     pacman -S tar zip unzip unrar
     pacman -S xarchiver // 压缩工具
     
     
     pacman -S xfce4-power-manager
     
     pacman -S base-devel
     
     pacman -S noto-fonts-emoji noto-fonts-emoji-blob //字体
     ```
     
   - 



- 





### 输入法 fcitx sogoupinyin

```bash
pacman -S fcitx fcitx-qt5 fcitx-configtool
yay -S fcitx-sogoupinyin
```


//polybar fonts
yay -S otf-apple-sf-pro
pacman -S arc-icon-theme
pacman -S qogir-icon-theme





