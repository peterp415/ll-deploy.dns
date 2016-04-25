#!/bin/bash

server_list="control.evdc.wavemarket.com
ns3.sfdc.wavemarket.com
ns5.sfdc.wavemarket.com
base1.engr.wavemarket.com"

for current_server in $server_list; do
    mkdir $current_server

    zone_dir="/etc/bind/"

    if [ -d "/etc/bind/zones/" ]; then
        zone_dir="/etc/bind/zones/"
    fi
    rsync -a root@$current_server:$zone_dir $current_server
done
