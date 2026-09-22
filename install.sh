sudo pacman -S figlet
clear
figlet "Dependencies & base packages" -f slant -c
sudo pacman -Syuu git sway dunst fuzzel neovim waybar swaylock bat xfce4-terminal blueman pavucontrol telegram-desktop obsidian playerctl flameshot nwg-look nodejs npm swayidle lightdm-gtk-greeter thunar engrampa
figlet "Paru & AUR packages" -f slant -c
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru ttf-adwaitamono-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd wlogout
figlet "Theming and ricing" -f slant -c
tar -xzf Palette.tar.gz
tar -xzf minimal-grub-theme.tar.gz
unzip MacOS-Pixel-Cursors.zip
tar -xJf Squared.tar.xz
sudo mv MacOS-Pixel-Cursors/MacOS-Pixel-Cursors/MacOS-Pixel-* /usr/share/icons/
sudo mv Palette-* /usr/share/icons/
sudo mv Squared /usr/share/themes
cd minimal-grub-theme && sudo ./Intsall.sh
clear
echo "Installation done, update /usr/share/icons/default/index.theme manually with MacOS-Pixel-Dark"
