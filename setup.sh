#!/usr/bin/env bash

# hi

# installing the essencials
yay -Syu --noconfirm -needed alsa alsa-utils bat btop bc cava discord dunst ffmpeg grim gtk3 gtk4 hyprland iptables kitty man mesa neovim nftables nwg-look overskride pavucontrol pipewire pipewire-alsa pipewire-pulse portproton qbittorrent ranger rofi slurp sof-firmware steam telegram-desktop thunar tree-sitter nerd-fonts waybar wayland wireplumber wl-clipboard xdg-user-dirs zsh zen-browser-bin 7zip

# installing ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# cloning powerlevel10k
cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# copying everything
cd dotfiles
cp * $HOME/

reboot
