#!/usr/bin/env bash

echo "Starting setup..."

# APT

PACKAGES=(
    ctags
    curl
    direnv
    git
    vim
    wget
    zsh
)

sudo apt update
sudo apt install -y ${PACKAGES[@]}

# Snap

SNAPS=(
    "android-studio --classic"
    "aws-cli --classic --edge"
    "go --classic"
    "intellij-idea-community --classic"
    "pycharm-community --classic"
    "slack --classic"
    "spotify"
    "vlc"
    "yq"
    "zoom-client"
)

for app in "${SNAPS[@]}"; do
    sudo snap install $app
done

# Brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# VIM

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +quit +quit

# ZSH

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Finished setup."
