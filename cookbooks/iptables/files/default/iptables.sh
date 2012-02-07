#!/bin/bash

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -F
iptables -F -t nat
iptables -F PACKET_DROPS
iptables -X PACKET_DROPS

iptables -N PACKET_DROPS

# Accept everything unless what is blocked
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

# smtp
iptables -A INPUT -p tcp -i eth0 --destination-port 25 -j REJECT

# 5432 port
iptables -A INPUT -p tcp -i eth0 --destination-port 5432 -j PACKET_DROPS

# snmp
iptables -A INPUT -p tcp -i eth0 --destination-port 199 -j PACKET_DROPS
iptables -A INPUT -p udp -i eth0 --destination-port 161 -j PACKET_DROPS

# Redis
iptables -A INPUT -s 192.168.152.20 -p tcp --destination-port 6379 -j ACCEPT
iptables -A INPUT -s 192.168.152.171 -p tcp --destination-port 6379 -j ACCEPT
iptables -A INPUT -s 192.168.176.63 -p tcp --destination-port 6379 -j ACCEPT
iptables -A INPUT -s 192.168.186.70 -p tcp --destination-port 6379 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 6379 -j REJECT

# Mysql
iptables -A INPUT -s 192.168.152.20 -p tcp --destination-port 3306 -j ACCEPT
iptables -A INPUT -s 192.168.152.171 -p tcp --destination-port 3306 -j ACCEPT
iptables -A INPUT -s 192.168.176.63 -p tcp --destination-port 3306 -j ACCEPT
iptables -A INPUT -s 192.168.186.70 -p tcp --destination-port 3306 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 3306 -j REJECT

# Memcached
iptables -A INPUT -s 192.168.152.20 -p tcp --destination-port 11211 -j ACCEPT
iptables -A INPUT -s 192.168.152.171 -p tcp --destination-port 11211 -j ACCEPT
iptables -A INPUT -s 192.168.176.63 -p tcp --destination-port 11211 -j ACCEPT
iptables -A INPUT -s 192.168.186.70 -p tcp --destination-port 11211 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 11211 -j REJECT

# NFS
iptables -A INPUT -s 192.168.152.20 -p tcp --destination-port 2049 -j ACCEPT
iptables -A INPUT -s 192.168.152.171 -p tcp --destination-port 2049 -j ACCEPT
iptables -A INPUT -s 192.168.176.63 -p tcp --destination-port 2049 -j ACCEPT
iptables -A INPUT -s 192.168.186.70 -p tcp --destination-port 2049 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 2049 -j REJECT
