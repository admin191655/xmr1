#!/bin/bash
apt-get update && apt-get -y upgrade && apt-get -y autoremove
apt-get install libcurl4-openssl-dev git -y
apt-get install build-essential -y
apt-get install autotools-dev autoconf -y 
apt-get install libcurl3 libcurl4-gnutls-dev -y
git clone https://github.com/wolf9466/cpuminer-multi && cd cpuminer-multi && ./autogen.sh
CFLAGS="-march=native" ./configure
make
