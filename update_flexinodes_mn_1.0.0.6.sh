#/bin/bash
clear
cd ~

echo "This script was forked from CryptoNeverSleeps"
echo "Ubuntu 16.04 is the recommended opearting system for this install."
echo

cd ~

wget https://github.com/nashsclay/Flexinodes/releases/download/untagged-89d6a4401e5d3ca9d34e/flexinodes_simple_1.0.0.5.tar.gz
sudo tar -xvf flexinodes_simple_1.0.0.5.tar.gz
sudo mv -f ./flexinodes-cli /usr/local/bin
sudo mv -f ./flexinodesd /usr/local/bin
sudo rm flexinodes_simple_1.0.0.5.tar.gz
echo "! Restarting Flexinodes Masternode !"
sudo flexinodes-cli stop
