#!/bin/bash

echo "Installing modules started"

sudo apt-get -y install libpcre3-dbg libpcre3-dev autoconf automake libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libmagic-dev libjansson-dev libjansson4
sudo apt-get -y install libnspr4-dev libnss3-dev liblz4-dev rustc cargo
sudo apt-get -y install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev liblz4-dev
sudo apt-get install -y pkg-config

echo "Installing Modules completed"
