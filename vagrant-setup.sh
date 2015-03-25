#!/usr/bin/env bash

apt-get -yq update

# java
apt-get -yq install git openjdk-7-jre-headless service-wrapper curl
update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

# elasticsearch
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elasticsearch.org/elasticsearch/1.5/debian stable main" | sudo tee -a /etc/apt/sources.list

apt-get update && apt-get install -yq elasticsearch

update-rc.d elasticsearch defaults 95 10
/etc/init.d/elasticsearch start
/usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-icu/2.5.0

/etc/init.d/elasticsearch restart


# NSQ
wget https://s3.amazonaws.com/bitly-downloads/nsq/nsq-0.3.2.linux-amd64.go1.4.1.tar.gz
tar -xvf nsq-0.3.2.linux-amd64.go1.4.1.tar.gz
mv nsq-0.3.2.linux-amd64.go1.4.1/bin/* /usr/local/bin/

# python, ruby
apt-get install -yq make git python-dev python-pip python-virtualenv ruby ruby-dev libffi-dev
pip install -U pip virtualenv

# Node, npm
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install -y nodejs

gem install compass

/usr/local/bin/pip install virtualenvwrapper

echo "source virtualenvwrapper.sh" > /home/vagrant/.bashrc
chmod a+x /home/vagrant/.bashrc

git clone https://github.com/hypothesis/h.git
