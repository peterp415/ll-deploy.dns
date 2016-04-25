#!/bin/bash

#This script isn't very pretty but it will only be used once.

server_list=("cobbler.common.sfdc.wavemarket.com" "aci-cobbler1.aci.sfdc.wavemarket.com")
zone_directory = "/etc/bind/"

for current_server in server_list; do  
  ssh root@$current_dns_server
  cd $zone_directory
  
  merged_zones_dest="/tmp/mergedzones/"
  mkdir $merged_zones_dest
  
  for db_zone in db.*; do
    #Strip db. from the string
    zone_stripped_of_db="$(echo "${db_zone}" | sed 's/^.\{3\}//')"
    
    #Check if the zone has digits (is reverse DNS) if so we can skip all of the logic below and just copy it to the mergedzones folder
    echo "${zone_stripped_of_db}" | grep -q '[0-9]'
    if [ $? != 0 ];
    then
      #Create new file under merged_zones
      touch $merged_zones_dest$zone_stripped_of_db
      #Remove old includes line
      head -n -1 $db_zone | cat  >> $merged_zones_dest$zone_stripped_of_db
  
      #try to find matching static zone and append it if exists    
      static_zone="static."$zone_stripped_of_db
  
      if [ -f $static_zone ];
      then
         merged_zone=$zone_stripped_of_db
         touch $merged_zones_dest$merged_zone
  
         cat $static_zone >> $merged_zones_dest$merged_zone
  
         echo "Successfully merged "$merged_zone
      else
        echo "No matching static file found, copied original db zone to mergedzones folder"
      fi
    else
      cat ${db_zone} >> $merged_zones_dest$zone_stripped_of_db
    fi
  done
  
  #Exit the remote server and rsync the merged zone files to a local folder with the name of the current server
  exit
  mkdir $current_server
  rsync -a root@$current_server:$merged_zones_dest $current_server
done
