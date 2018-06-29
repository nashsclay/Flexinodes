cd ~/.flexinodes
sudo rm budget.dat db.log debug.log fee_estimates.dat flexinodesd.pid mnpayments.dat mncache.dat
sudo rm -R backups/
sudo rm -R blocks/
sudo rm -R chainstate/
sudo rm -R database/
flexinodes-cli stop
echo "Masternode restarted"
