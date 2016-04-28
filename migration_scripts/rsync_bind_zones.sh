#!/bin/bash

server_list_incl_zones="control.evdc.wavemarket.com
ns3.wavemarket.com
ns5.sfdc.wavemarket.com"

server_list="base1.engr.wavemarket.com
base2.engr.wavemarket.com"

rm ../masters/*

#get the 
for current_server in $server_list_incl_zones; do
    #mkdir ../masters/$current_server

    #Get all files from both /etc/bind
    zone_dir='/etc/bind/zones/'
    rsync -a root@$current_server:$zone_dir ../masters/
done

for current_server in $server_list; do
    #mkdir ../masters/$current_server
    zone_dir='/etc/bind/'
    rsync -a root@$current_server:$zone_dir ../masters/
done
