#/bin/bash
clear
cd ~

echo "This script was forked from CryptoNeverSleeps"
echo "Ubuntu 16.04 is the recommended opearting system for this install."
echo

cd ~

wget https://github.com/nashsclay/Flexinodes/releases/download/untagged-1d2b11f03d899d08d562/flexinodes_1007update.tar.gz
sudo tar -xvf flexinodes_updated.1.0.0.6.tar.gz
sudo mv -f ./flexinodes-cli /usr/local/bin
sudo mv -f ./flexinodesd /usr/local/bin
sudo mv -f ./flexinodes-tx /usr/local/bin
sudo rm flexinodes_updated.1.0.0.6.tar.gz
echo "! Restarting Flexinodes Masternode !"
sudo flexinodes-cli stop