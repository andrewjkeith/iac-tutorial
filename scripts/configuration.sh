#!/bin/bash
set -e

echo "  ----- install ruby and bundler -----  "
sleep 30
apt-get update
apt-get install -y ruby-full build-essential
gem install --no-rdoc --no-ri bundler

echo "  ----- install mongodb -----  "
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org

echo "  ----- start mongodb -----  "
systemctl start mongod
systemctl enable mongod

echo "  ----- copy unit file for application -----  "
wget https://gist.githubusercontent.com/andrewjkeith/7964967dbb30c4e3a1874eebb416d46a/raw/c2ec45ae0eb9b13d06bbf5b69da06163f4fb21b2/raddit.service
mv raddit.service /etc/systemd/system/raddit.service

