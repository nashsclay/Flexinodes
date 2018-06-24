sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install nano htop git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
cd
wget https://github.com/zero24x/flexinodes/archive/untagged-74609a6f600f7eb88ba5.tar.gz
tar -xzf flexinodes-untagged-74609a6f600f7eb88ba5.tar.gz
#sudo git clone https://github.com/zero24x/flexinodes
cd flexinodes-untagged-74609a6f600f7eb88ba5 
sudo ./autogen.sh
sudo ./configure
sudo make    #Delete -j4 if don't know how many cores (CPU) Same for next line.
sudo make install # optional
cd src
sudo strip flexinodesd
sudo strip flexinodes-cli
sudo strip flexinodes-tx 
