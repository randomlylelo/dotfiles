# GITCLONE THE DOTFILES FOLDER. All configs will be here.
echo "Installing config files from dotfiles on github"

alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/randomlylelo/dotfiles $HOME/.cfg
cfg checkout
cfg config --local status.showUntrackedFiles no

echo "Installation of config files done."
echo "Starting installation of regular packages."

# Setup PIKAUR to install AUR Packages -- https://github.com/actionless/pikaur
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd $HOME

# Start installation of regular packages.
# Install Ruby on Rails Depencies
sudo pacman -S ruby sqlite nodejs yarn

# Install Fonts
pacman -S otf-overpass
pacman -S ttf-jetbrains-mono

# Install WM
pacman -S awesome
# Install custom widgets
mkdir $HOME/.config/awesome/awesome-wm-widgets && mkdir $HOME/.config/awesome/apw
git clone https://github.com/randomlylelo/awesome-wm-widgets $HOME/.config/awesome/awesome-wm-widgets
git clone https://github.com/randomlylelo/apw $HOME/.config/awesome/apw

# Install default stuff.
pacman -S alacritty
pacman -S keepassxc

# Install patched dmenu
git clone https://github.com/randomlylelo/custom_patched_dmenu
cd custom_patched_dmenu && sudo make install 
cd $HOME

# Install zsh & setup oh-my-zsh
pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Copy over custom theme.
cp $HOME/zshcustom/customtheme.zsh-theme $HOME/.oh-my-zsh/custom/themes
# Remove custom theme
rm -r $HOME/zshcustom/
cfg update-index --skip-worktree ~/zshcustom/customtheme.zsh-theme
echo
echo "Note make sure to update 'ZSH=\"/home/zhang/.oh-my-zsh\"' if user name is different in .zshrc file."
echo