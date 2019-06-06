#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

echo -e ${YELLOW}"Welcome to the Tango Automated Update 1.2.0 (4in1)."${NC}
echo "Please wait while updates are performed..."
sleep 5
echo "Stopping first node, please wait...";
tango-cli -datadir=/home/tango/.tango stop
echo "Stopping second node, please wait...";
tango-cli -datadir=/home/tango2/.tango stop
echo "Stopping third node, please wait...";
tango-cli -datadir=/home/tango3/.tango stop
echo "Stopping fourth node, please wait...";
tango-cli -datadir=/home/tango4/.tango stop
sleep 10
echo "Removing binaries..."
cd /usr/local/bin
rm -rf tangod tango-cli tango-tx
echo "Downloading latest binaries"
wget https://github.com/KingricharVD/Tango/releases/download/1.2/tango_linux.1_2_0.tar.gz
tar -xzf tango_linux.1_2_0.tar.gz
sudo chmod 755 -R  /usr/local/bin/tango*
rm -rf tango_linux.1_2_0.tar.gz
echo "Deleting old nodes from node config files"
sed -i '/addnode/d' /home/tango/.tango/tango.conf
sed -i '/addnode/d' /home/tango2/.tango/tango.conf
sed -i '/addnode/d' /home/tango3/.tango/tango.conf
sed -i '/addnode/d' /home/tango4/.tango/tango.conf

echo "Adding new nodes..."
echo "addnode=45.77.62.203" >> /home/tango/.tango/tango.conf
echo "addnode=207.148.3.46" >> /home/tango/.tango/tango.conf
echo "addnode=136.243.185.24" >> /home/tango/.tango/tango.conf
echo "addnode=107.173.141.125" >> /home/tango/.tango/tango.conf

echo "addnode=45.77.62.203" >> /home/tango2/.tango/tango.conf
echo "addnode=207.148.3.46" >> /home/tango2/.tango/tango.conf
echo "addnode=136.243.185.24" >> /home/tango2/.tango/tango.conf
echo "addnode=107.173.141.125" >> /home/tango2/.tango/tango.conf

echo "addnode=45.77.62.203" >> /home/tango3/.tango/tango.conf
echo "addnode=207.148.3.46" >> /home/tango3/.tango/tango.conf
echo "addnode=136.243.185.24" >> /home/tango3/.tango/tango.conf
echo "addnode=107.173.141.125" >> /home/tango3/.tango/tango.conf

echo "addnode=45.77.62.203" >> /home/tango4/.tango/tango.conf
echo "addnode=207.148.3.46" >> /home/tango4/.tango/tango.conf
echo "addnode=136.243.185.24" >> /home/tango4/.tango/tango.conf
echo "addnode=107.173.141.125" >> /home/tango4/.tango/tango.conf

echo "Syncing first node, please wait...";
tangod -datadir=/home/tango/.tango -daemon
until tango-cli -datadir=/home/tango/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"First node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing second node, please wait...";
tangod -datadir=/home/tango2/.tango -daemon
until tango-cli -datadir=/home/tango2/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Second node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing third node, please wait...";
tangod -datadir=/home/tango3/.tango -daemon
until tango-cli -datadir=/home/tango3/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Third node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Syncing fourth node, please wait...";
tangod -datadir=/home/tango4/.tango -daemon
until tango-cli -datadir=/home/tango4/.tango mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Fourth node is fully synced. Your masternode is running!"${NC}
sleep 5
echo "Deleting temporary files"
cd ~
echo -e ${GREEN}"If you think that this script helped in some way, feel free to donate for our work:"${NC}
echo "The END. You can close now the SSH terminal session";

