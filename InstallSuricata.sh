#!/bin/bash

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
