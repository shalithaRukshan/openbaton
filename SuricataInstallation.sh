#!/bin/bash

echo "================================================================================="
echo "Installing Suricata"
echo "================================================================================="
apt-get update
apt-get -y install python-pip
pip install --upgrade pip
pip3 install PyYAML
apt-get -y install libpcre3-dbg libpcre3-dev autoconf automake libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libmagic-dev libjansson-dev libjansson4
apt-get -y install libnspr4-dev libnss3-dev liblz4-dev rustc cargo
apt-get -y install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev

echo "=======================================DOWNLOADING SURICATA=========================================="
wget http://www.openinfosecfoundation.org/download/suricata-6.0.1.tar.gz
tar -zxf suricata-6.0.1.tar.gz

echo "======================================CONFIGURE SURICATA==========================================="
cd suricata-6.0.1/
./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var
make install-full
ethtool -K eth0 gro off lro offY

echo "======================================START SURICATA==========================================="
/usr/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal &
