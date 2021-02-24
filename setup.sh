
# Install default stuff.
pacman -S alacritty

#


# Install zsh & setup oh-my-zsh
pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# do cp zshcustom/ blah blah later after git pull of the config files



# Install Fonts
pacman -S otf-overpass
pacman -S ttf-jetbrains-mono