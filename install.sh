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
sudo cp index.theme /usr/share/icons/default/ -r
sudo cp lightdm/* /etc/lightdm/ -r
cp dunst/ ~/.config/ -r
cp nvim/ ~/.config/ -r
cp fuzzel/ ~/.config/ -r
cp scripts/ ~/.config/ -r
cp waybar/ ~/.config/ -r
cp wlogout/ ~/.config/ -r
cp sway/ ~/.config/ -r
cp wallpapers/ ~/.config/ -r
