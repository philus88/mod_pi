#!/bin/bash

sudo apt-get update --fix-missing
sudo apt-get install virtualenv python3-pip python3-dev git build-essential libasound2-dev libjack-jackd2-dev liblilv-dev libjpeg-dev zlib1g-dev liblilv-dev libreadline-dev

git clone https://github.com/moddevices/mod-host
git clone https://github.com/moddevices/mod-ui
git clone https://github.com/micahvdm/mod

mkdir .lv2

cd mod-host
make
sudo make install
cd ..
cd mod-ui
sudo pip3 install -r requirements.txt
sudo make -C utils
cd ..
cd mod
sudo cp mod-ui.service mod-host.service /usr/lib/systemd/system
#unzip plugins.zip
#cd plugins
#sudo mv * $HOME/.lv2