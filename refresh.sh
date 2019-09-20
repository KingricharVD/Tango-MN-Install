#/bin/bash

cd ~
cd /usr/local/bin
./tango-cli stop
rm -rf tangod tango-cli tango-tx
wget https://github.com/tangocrypto/Tango/releases/download/1.2.0/tango_linux.1_2_0.tar.gz
tar -xzf tango_linux.1_2_0.tar.gz
rm -rf tango_linux.1_2_0.tar.gz
./tangod -daemon
sleep 30
./tango-cli getinfo
