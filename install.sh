xcode-select --install
# installs brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installs starship
sudo mkdir /usr/local/bin
curl -sS https://starship.rs/install.sh | sh

# install rust
brew install rust

# Install cargo apps
Cargo install exa bat tokei ytop ripgrep fd-find

# Installing zsh plugins
brew install direnv
brew install zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions

# Installing vim
brew install node nvim npm
pip3 install --upgrade pip
LV_BRANCH='release-1.3/neovim-0.9'  bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) --install-dependencies -y

# Configuring node
npm install --global yarn

# Installing fonts
cd ~/Library/Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/RobotoMono.zip
unzip RobotoMono.zip
rm LICENSE.txt readme.md

# Creates workspace
mkdir ~/codes


