#/bin/bash
clear
cd ~

echo "This script was forked from CryptoNeverSleeps"
echo "Ubuntu 16.04 is the recommended opearting system for this install."
echo

cd ~

wget https://github.com/nashsclay/Flexinodes/releases/download/v1.0.0.8/flex_1.0.0.8_update.tar.gz
sudo tar -xvf flex_1.0.0.8_update.tar.gz
sudo mv -f flexinodes-cli /usr/local/bin
sudo mv -f flexinodesd /usr/local/bin
sudo mv -f flexinodes-tx /usr/local/bin
sudo rm flex_1.0.0.8_update.tar.gz
echo "! Restarting Flexinodes Masternode !"
cd ~/.flexinodes
sudo rm budget.dat db.log debug.log fee_estimates.dat flexinodesd.pid mnpayments.dat mncache.dat
sudo rm -R backups/
sudo rm -R blocks/
sudo rm -R chainstate/
sudo rm -R database/
sudo flexinodes-cli stop
echo "Masternode restarted"
