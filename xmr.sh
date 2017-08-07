#!/bin/bash
apt-get update && apt-get -y upgrade && apt-get -y autoremove
apt-get install automake -y
apt-get install libjansson-dev -y
apt-get install libcurl4-openssl-dev -y
apt-get install build-essential -y
apt-get install libcurl3 libcurl4-gnutls-dev -y
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 6))
git clone https://github.com/OhGodAPet/cpuminer-multi.git && cd cpuminer-multi && ./autogen.sh
CFLAGS="-march=native" ./configure
make
./minerd --threads=6 -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u nhac.tien1988@gmail.com -p x
