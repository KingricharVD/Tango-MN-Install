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
