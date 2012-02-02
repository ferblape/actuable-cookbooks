#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
aptitude update &&
apt-get -o Dpkg::Options::="--force-confnew" -y -fuy dist-upgrade &&
# Install base packages
apt-get remove -y nano &&
apt-get install -y gcc g++ make zlib1g-dev git-core libxml2-dev libxslt-dev libopenssl-ruby\
                   libsqlite3-dev sqlite3 autoconf imagemagick curl libssl-dev\
                   libcurl4-openssl-dev libreadline5-dev libncurses5-dev openntpd\
                   libyaml-0-2 libyaml-dev &&
cd /usr/local/src &&
curl -O ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz &&
tar xzvf readline-6.2.tar.gz &&
cd readline-6.2 &&
./configure --prefix=/usr/local &&
make && make install &&
cd /usr/local/src &&
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz &&
tar xzvf yaml-0.1.4.tar.gz &&
cd yaml-0.1.4 &&
./configure --prefix=/usr/local &&
make &&
make install &&
# Install Ruby and Chef
cd /usr/local/src &&
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.bz2 &&
tar jxvf ruby-1.9.3-p0.tar.bz2 &&
cd ruby-1.9.3-p0 &&
autoconf &&
./configure --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib &&
make && make install &&
gem install chef --no-ri --no-rdoc