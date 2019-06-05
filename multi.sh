#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the Tango Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a Tango Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo "Creating 4 Tango system users with no-login access:"
sudo adduser --system --home /home/tango tango
sudo adduser --system --home /home/tango2 tango2
sudo adduser --system --home /home/tango3 tango3
sudo adduser --system --home /home/tango4 tango4
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/tango
cd /root/tango
wget https://github.com/tangocrypto/Tango/releases/download/1.0.0/tango-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzvf tango-1.0.0-x86_64-linux-gnu.tar.gz
sudo mv /root/tango/tangod /root/tango/tango-cli /root/tango/tango-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/tango*
sudo mkdir /home/tango/.tango
sudo touch /home/tango/.tango/tango.conf
echo -e "${GREEN}Configuring Wallet for first node${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango/.tango/tango.conf
echo "server=1" >> /home/tango/.tango/tango.conf
echo "daemon=1" >> /home/tango/.tango/tango.conf
echo "maxconnections=250" >> /home/tango/.tango/tango.conf
echo "masternode=1" >> /home/tango/.tango/tango.conf
echo "rpcport=8483" >> /home/tango/.tango/tango.conf
echo "listen=0" >> /home/tango/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango/.tango/tango.conf
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
sudo mkdir /home/tango2/.tango
sudo touch /home/tango2/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango2/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango2/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango2/.tango/tango.conf
echo "server=1" >> /home/tango2/.tango/tango.conf
echo "daemon=1" >> /home/tango2/.tango/tango.conf
echo "maxconnections=250" >> /home/tango2/.tango/tango.conf
echo "masternode=1" >> /home/tango2/.tango/tango.conf
echo "rpcport=8485" >> /home/tango2/.tango/tango.conf
echo "listen=0" >> /home/tango2/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango2/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango2/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango2/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango2/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango2/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango2/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango2/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango2/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango2/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango2/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango2/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango2/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango2/.tango/tango.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
sudo mkdir /home/tango3/.tango
sudo touch /home/tango3/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango3/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango3/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango3/.tango/tango.conf
echo "server=1" >> /home/tango3/.tango/tango.conf
echo "daemon=1" >> /home/tango3/.tango/tango.conf
echo "maxconnections=250" >> /home/tango3/.tango/tango.conf
echo "masternode=1" >> /home/tango3/.tango/tango.conf
echo "rpcport=8486" >> /home/tango3/.tango/tango.conf
echo "listen=0" >> /home/tango3/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango3/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango3/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango3/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango3/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango3/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango3/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango3/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango3/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango3/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango3/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango3/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango3/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango3/.tango/tango.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 4th node${NC}"
sudo mkdir /home/tango4/.tango
sudo touch /home/tango4/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango4/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango4/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango4/.tango/tango.conf
echo "server=1" >> /home/tango4/.tango/tango.conf
echo "daemon=1" >> /home/tango4/.tango/tango.conf
echo "maxconnections=250" >> /home/tango4/.tango/tango.conf
echo "masternode=1" >> /home/tango4/.tango/tango.conf
echo "rpcport=8487" >> /home/tango4/.tango/tango.conf
echo "listen=0" >> /home/tango4/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango4/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango4/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango4/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango4/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango4/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango4/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango4/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango4/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango4/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango4/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango4/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango4/.tango/tango.conf
sleep 5 
fi
echo "Syncing first node, please wait...";
tangod -datadir=/home/tango/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. You 1st masternode is running!"${NC}
sleep 10
echo "Syncing second node, please wait...";
tangod -datadir=/home/tango2/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango2/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. You second masternode is running!"${NC}
sleep 10
echo "Syncing third node, please wait...";
tangod -datadir=/home/tago3/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango3/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. You third masternode is running!"${NC}
sleep 10
echo "Syncing fourth node, please wait...";
tangod -datadir=/home/tango4/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango4/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You fourth masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your TNGO Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the Tango Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a Tango Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo "Creating 4 Tango system users with no-login access:"
sudo adduser --system --home /home/tango tango
sudo adduser --system --home /home/tango2 tango2
sudo adduser --system --home /home/tango3 tango3
sudo adduser --system --home /home/tango4 tango4
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/tango
cd /root/tango
wget https://github.com/tangocrypto/Tango/releases/download/1.0.0/tango-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzvf tango-1.0.0-x86_64-linux-gnu.tar.gz
sudo mv /root/tango/tangod /root/tango/tango-cli /root/tango/tango-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/tango*
sudo mkdir /home/tango/.tango
sudo touch /home/tango/.tango/tango.conf
echo -e "${GREEN}Configuring Wallet for first node${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango/.tango/tango.conf
echo "server=1" >> /home/tango/.tango/tango.conf
echo "daemon=1" >> /home/tango/.tango/tango.conf
echo "maxconnections=250" >> /home/tango/.tango/tango.conf
echo "masternode=1" >> /home/tango/.tango/tango.conf
echo "rpcport=8483" >> /home/tango/.tango/tango.conf
echo "listen=0" >> /home/tango/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango/.tango/tango.conf
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
sudo mkdir /home/tango2/.tango
sudo touch /home/tango2/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango2/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango2/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango2/.tango/tango.conf
echo "server=1" >> /home/tango2/.tango/tango.conf
echo "daemon=1" >> /home/tango2/.tango/tango.conf
echo "maxconnections=250" >> /home/tango2/.tango/tango.conf
echo "masternode=1" >> /home/tango2/.tango/tango.conf
echo "rpcport=8485" >> /home/tango2/.tango/tango.conf
echo "listen=0" >> /home/tango2/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango2/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango2/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango2/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango2/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango2/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango2/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango2/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango2/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango2/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango2/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango2/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango2/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango2/.tango/tango.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
sudo mkdir /home/tango3/.tango
sudo touch /home/tango3/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango3/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango3/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango3/.tango/tango.conf
echo "server=1" >> /home/tango3/.tango/tango.conf
echo "daemon=1" >> /home/tango3/.tango/tango.conf
echo "maxconnections=250" >> /home/tango3/.tango/tango.conf
echo "masternode=1" >> /home/tango3/.tango/tango.conf
echo "rpcport=8486" >> /home/tango3/.tango/tango.conf
echo "listen=0" >> /home/tango3/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango3/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango3/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango3/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango3/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango3/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango3/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango3/.tango/tango.conf
#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the Tango Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a Tango Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

if [[ $AGREE =~ "y" ]] ; then
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the first node:"${NC}
read privkey
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for second node:"${NC}
read privkey2
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for the third node:"${NC}
read privkey3
echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 4th node:"${NC}
read privkey4
echo "Creating 4 Tango system users with no-login access:"
sudo adduser --system --home /home/tango tango
sudo adduser --system --home /home/tango2 tango2
sudo adduser --system --home /home/tango3 tango3
sudo adduser --system --home /home/tango4 tango4
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common 
sudo apt-get -y install build-essential  
sudo apt-get -y install libtool autotools-dev autoconf automake  
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libevent-dev 
sudo apt-get -y install libboost-all-dev 
sudo apt-get -y install pkg-config  
sudo add-apt-repository ppa:bitcoin/bitcoin 
sudo apt-get update 
sudo apt-get -y install libdb4.8-dev 
sudo apt-get -y install libdb4.8++-dev 
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5 
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
#sudo apt install git 
cd /var 
sudo touch swap.img 
sudo chmod 600 swap.img 
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
sudo mkswap /var/swap.img 
sudo swapon /var/swap.img 
sudo echo ' /var/swap.img none swap sw 0 0 ' >> /etc/fstab
cd ~ 
sudo mkdir /root/tango
cd /root/tango
wget https://github.com/tangocrypto/Tango/releases/download/1.0.0/tango-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzvf tango-1.0.0-x86_64-linux-gnu.tar.gz
sudo mv /root/tango/tangod /root/tango/tango-cli /root/tango/tango-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/tango*
sudo mkdir /home/tango/.tango
sudo touch /home/tango/.tango/tango.conf
echo -e "${GREEN}Configuring Wallet for first node${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango/.tango/tango.conf
echo "server=1" >> /home/tango/.tango/tango.conf
echo "daemon=1" >> /home/tango/.tango/tango.conf
echo "maxconnections=250" >> /home/tango/.tango/tango.conf
echo "masternode=1" >> /home/tango/.tango/tango.conf
echo "rpcport=8483" >> /home/tango/.tango/tango.conf
echo "listen=0" >> /home/tango/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango/.tango/tango.conf
sleep 5
echo -e "${GREEN}Configuring Wallet for second node${NC}"
sudo mkdir /home/tango2/.tango
sudo touch /home/tango2/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango2/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango2/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango2/.tango/tango.conf
echo "server=1" >> /home/tango2/.tango/tango.conf
echo "daemon=1" >> /home/tango2/.tango/tango.conf
echo "maxconnections=250" >> /home/tango2/.tango/tango.conf
echo "masternode=1" >> /home/tango2/.tango/tango.conf
echo "rpcport=8485" >> /home/tango2/.tango/tango.conf
echo "listen=0" >> /home/tango2/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango2/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango2/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango2/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango2/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango2/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango2/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango2/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango2/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango2/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango2/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango2/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango2/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango2/.tango/tango.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for third node${NC}"
sudo mkdir /home/tango3/.tango
sudo touch /home/tango3/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango3/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango3/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango3/.tango/tango.conf
echo "server=1" >> /home/tango3/.tango/tango.conf
echo "daemon=1" >> /home/tango3/.tango/tango.conf
echo "maxconnections=250" >> /home/tango3/.tango/tango.conf
echo "masternode=1" >> /home/tango3/.tango/tango.conf
echo "rpcport=8486" >> /home/tango3/.tango/tango.conf
echo "listen=0" >> /home/tango3/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango3/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango3/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango3/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango3/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango3/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango3/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango3/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango3/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango3/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango3/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango3/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango3/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango3/.tango/tango.conf
sleep 5 
echo -e "${GREEN}Configuring Wallet for 4th node${NC}"
sudo mkdir /home/tango4/.tango
sudo touch /home/tango4/.tango/tango.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/tango4/.tango/tango.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/tango4/.tango/tango.conf
echo "rpcallowip=127.0.0.1" >> /home/tango4/.tango/tango.conf
echo "server=1" >> /home/tango4/.tango/tango.conf
echo "daemon=1" >> /home/tango4/.tango/tango.conf
echo "maxconnections=250" >> /home/tango4/.tango/tango.conf
echo "masternode=1" >> /home/tango4/.tango/tango.conf
echo "rpcport=8487" >> /home/tango4/.tango/tango.conf
echo "listen=0" >> /home/tango4/.tango/tango.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):8484" >> /home/tango4/.tango/tango.conf
echo "masternodeprivkey=$privkey" >> /home/tango4/.tango/tango.conf
echo "addnode=192.250.236.139" >> /home/tango4/.tango/tango.conf
echo "addnode=155.138.224.172" >> /home/tango/.tango/tango.conf
echo "addnode=45.77.226.105" >> /home/tango4/.tango/tango.conf
echo "addnode=195.181.216.136" >> /home/tango4/.tango/tango.conf
echo "addnode=194.48.168.103" >> /home/tango4/.tango/tango.conf
echo "addnode=194.182.77.240" >> /home/tango4/.tango/tango.conf
echo "addnode=199.247.0.128" >> /home/tango4/.tango/tango.conf
echo "addnode=207.246.68.57" >> /home/tango4/.tango/tango.conf
echo "addnode=81.2.255.167" >> /home/tango4/.tango/tango.conf
echo "addnode=45.76.134.69" >> /home/tango4/.tango/tango.conf
echo "addnode=80.211.201.13" >> /home/tango4/.tango/tango.conf
sleep 5 
fi
echo "Syncing first node, please wait...";
tangod -datadir=/home/tango/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. You 1st masternode is running!"${NC}
sleep 10
echo "Syncing second node, please wait...";
tangod -datadir=/home/tango2/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango2/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. You second masternode is running!"${NC}
sleep 10
echo "Syncing third node, please wait...";
tangod -datadir=/home/tago3/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango3/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. You third masternode is running!"${NC}
sleep 10
echo "Syncing fourth node, please wait...";
tangod -datadir=/home/tango4/.tango -daemon
sleep 10 
until tango-cli -datadir=/home/tango4/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You fourth masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your TNGO Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
