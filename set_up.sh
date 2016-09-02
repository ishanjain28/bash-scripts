#!/bin/bash

echo " "
echo "Run this in an empty folder. Failure to do so may cause data loss."
read -p "[Enter] to continue. Ctrl + C to cancel."

echo " "
echo "Backing up the sources list."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

echo " "
echo "Now adding Repositories and keys."
read -p "[Enter] to continue. Ctrl + C to cancel."
sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
sudo add-apt-repository -y ppa:wseverin/ppa
sudo add-apt-repository -y ppa:saiarcot895/myppa
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886


echo " "
echo "Now updating sources.list with the newly added Repositories."
sudo apt-get -y update && sudo apt-get -y upgrade

echo " "
echo "Now installing everything I use."
sudo apt-get install -y aria2
sudo apt-get install -y axel
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install  apt-fast
echo | sudo apt-fast -y install uget
echo | sudo apt-fast -y install oracle-java8-installer
echo | sudo apt-fast -y install ubuntu-restricted-extras
echo | sudo apt-fast -y install vlc
echo | sudo apt-fast -y install gcc
echo | sudo apt-fast -y install g++
echo | sudo apt-fast -y install clang
echo | sudo apt-fast -y install thunderbird
echo | sudo apt-fast -y install openssl
echo | sudo apt-fast -y install openssh-server
echo | sudo apt-fast -y install gparted
echo | sudo apt-fast -y install audacity
echo | sudo apt-fast -y install blueman
echo | sudo apt-fast -y install spotify-client

echo " "
echo "Creating a temporary folder for .deb files and downloading files."
mkdir .temporary
aria2c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -d .temporary

echo " "
echo "Installing download .deb files"
cd .temporary
dpkg -i google-chrome-stable_current_amd64.deb
cd ..

echo " "
echo "Deleting Temporary files."
rm -rf .temporary

echo " "
echo "Fixing Dependcies."
sudo apt-get -y autoclean
sudo apt-get -f -y install