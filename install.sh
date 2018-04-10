#!/bin/sh

sudo apt-get update
sudo apt-get -y upgrade --fix-missing

sudo apt-get install -y git make build-essential libavahi-compat-libdnssd-dev
wget -O - https://raw.githubusercontent.com/audstanley/NodeJs-Raspberry-Pi/master/Install-Node.sh | sudo bash;

sudo apt-get install -y nodejs

sudo npm install -g homebridge --unsafe-perm
sudo npm install -g homebridge-edomoticz
sudo npm install -g homebridge-http

mkdir ~/.homebridge
cp config.json ~/.homebridge/

sudo dpkg -i libssl1.0.0_1.0.1t-1+deb8u6_armhf.deb

curl -L install.domoticz.com | sudo bash

cd /opt/nodejs/lib/node_modules/homebridge && sudo npm install --unsafe-perm mdns && sudo npm rebuild --unsafe-perm

sudo ln -s /opt/nodejs/bin/homebridge /usr/bin/homebridge

