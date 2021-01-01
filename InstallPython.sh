#!/bin/bash

echo "================================================================================="
echo "Installing Suricata"
echo "================================================================================="
sudo apt-get update
sudo apt-get -y install python3-pip
pip install --upgrade pip
pip3 install PyYAML
echo "Python installation completed"
