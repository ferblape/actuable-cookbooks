#!/bin/bash

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -F
iptables -F -t nat
iptables -F PACKET_DROPS
iptables -X PACKET_DROPS

iptables -N PACKET_DROPS

### ACEPTA TODO EL TRAFICO DE CONEXIONES YA ESTABLECIDAS O RELACIONADAS
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

# Se descartan las conexiones al puerto 25 desde internet
iptables -A INPUT -p tcp -i eth0 --destination-port 25 -j REJECT

# Se descartan las conexiones al puerto 5432 desde internet
iptables -A INPUT -p tcp -i eth0 --destination-port 5432 -j PACKET_DROPS

# Se descartan las conexiones al SNMP desde internet
iptables -A INPUT -p tcp -i eth0 --destination-port 199 -j PACKET_DROPS
iptables -A INPUT -p udp -i eth0 --destination-port 161 -j PACKET_DROPS

# Se descartan las conexiones al SNMP desde internet
iptables -A INPUT -p tcp -i eth0 --destination-port 6379 -j PACKET_DROPS
