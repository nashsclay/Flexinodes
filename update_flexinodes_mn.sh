#/bin/bash

cd ~

echo "This script was forked from CryptoNeverSleeps"
echo "Ubuntu 16.04 is the recommended opearting system for this install."
echo && echo && echo

echo "Do you want to upgrade? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt autoremove -y

  cd /var
  sudo touch swap.img
  sudo chmod 600 swap.img
  sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=3000
  sudo mkswap /var/swap.img
  sudo swapon /var/swap.img
  sudo free
  sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
  cd
  
fi 
cd ~

echo "! Removing Flexinodes !"
sudo rm -f /usr/local/bin/flexinodesd
sudo rm -f /usr/local/bin/flexinodes-cli
sudo rm -f /usr/local/bin/flexinodes-qt

wget https://github.com/nashsclay/Flexinodes/releases/download/untagged-89d6a4401e5d3ca9d34e/flexinodes_simple_1.0.0.5.tar.gz
tar -zxvf /usr/local/bin/flexinodes_simple_1.0.0.5.tar.gz
sudo rm flexinodes_simple_1.0.0.5.tar.gz
echo "! Restarting Flexinodes Masternode !"
sudo flexinodes-cli stop
