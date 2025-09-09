#!/bin/bash

current_eth0_ip = $(ip addr | grep eth0 | grep inet | grep -oP "\d+\.\d+\.\d+\.\d+/24")

if [ "$current_eth0_ip" != "192.189.199.100/24" ]; then
    ifconfig eth0 192.168.199.100 netmask 255.255.255.0
    route add default gw 192.168.199.1
    route add -net 192.168.15.0 netmask 255.255.255.0 gw 192.168.199.59 dev eth0
    ifconfig eth0 up 
fi
