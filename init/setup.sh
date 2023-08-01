#!/bin/bash
# created by: Ariel Chura

# To run this file make sure you have the permissions
# chmod +x setup.sh

lines="\n\n\n"

# Funtion to revert changes if an error ocurred
revert_changes() {
  echo "An error ocurred. Reverting changes..."

  # Remove homebrew if there is an error
   if command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  fi

  # remove nvm
  rm -rf ~/.nvm

  # remove ssh keys
  rm -rf ~/.ssh/id_rsa*

  # restore .zshrc
  if [ -f ~/.zshrc.bak ]; then
    mv ~/.zshrc.bak ~/.zshrc
  fi

  echo "The changes have been reverted."
  exit 1
}

# error handling
trap revert_changes ERR

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# personal apps
brew install --cask warp
brew install --cask visual-studio-code
brew install --cask sourcetree
brew install --cask google-chrome
brew install --cask figma
brew install --cask postman
brew install --cask reverso
brew install docker

# optional installation
brew install --cask jetbrains-toolbox
brew install --cask android-studio
brew install --cask datagrip

# install common tools
brew install git
brew install nvm
brew install rbenv
brew install jq


# install ho_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# config nvm
echo -e $lines >> ~/.zshrc
mkdir ~/.nvm
echo 'NVM Config' >> ~/.zshrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.zshrc

# config rbenv
echo -e $lines >> ~/.zshrc
echo 'RBENV Config' >> ~/.zshrc
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
source ~/.zshrc

# config android
echo -e $lines >> ~/.zshrc
echo 'Android Config' >> ~/.zshrc
echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.zshrc

# ssh-keygen
ssh-keygen -t rsa -b 4096 -C "your_email@gmail.com"

# git config
git config --global user.name "Ariel Chura"
git config --global user.email "your_email@gmail.com"

# install ruby versions
rbenv install 2.7.5
rbenv install 3.2.2 # latest in 07/2023

# set ruby 2.7.5 as global version
rbenv global 2.7.5

# install watchman
brew install watchman

# install CocoaPods
gem install bundler
gem install cocoapods

# android react native dependencies
brew tap homebrew/cask-versions
brew install --cask zulu11

# get path to where cask was installed to double-click installer
brew info --cask zulu11

source ~/.zshrc

# Remove backup file
if [ -f ~/.zshrc.bak ]; then
  rm ~/.zshrc.bak
fi

echo "✅ The installation has finished successfully!"
echo "✅ The installation has finished successfully!"
echo "✅ The installation has finished successfully!"
