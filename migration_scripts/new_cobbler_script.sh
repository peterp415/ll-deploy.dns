#!/bin/bash

if [ -d cobbler_zones ]; then
  rm -rf cobbler_zones
fi

mkdir cobbler_zones

scp root@cobbler.common.sfdc.wavemarket.com:/etc/bind/* cobbler_zones/

cd cobbler_zones

mkdir merged_zones

for db_zone in db.*; do
  #Strip db. from the string
  zone_stripped_of_db="$(echo "${db_zone}" | sed 's/^.\{3\}//')"

  echo $zone_stripped_of_db

  #Create new file under merged_zones
  touch merged_zones/"db."$zone_stripped_of_db
  #Remove old includes line
  grep -v '$INCLUDE' $db_zone  >> merged_zones/"db."$zone_stripped_of_db

  #try to find matching static zone and append it if exists
  static_zone="static."$zone_stripped_of_db

  if [ -f $static_zone ];
  then
     cat $static_zone >> merged_zones/"db."$zone_stripped_of_db

     echo "Successfully merged static and db zones of "$zone_stripped_of_db
  else
     echo "No matching static file found, copied original db zone to mergedzones folder"
  fi
done

cd ..

if [ -d aci_cobbler1_zones ]; then
  rm -rf aci_cobbler1_zones
fi

mkdir aci_cobbler1_zones

scp root@aci-cobbler1.aci.sfdc.wavemarket.com:/etc/bind/* aci_cobbler1_zones/

cd aci_cobbler1_zones

mkdir merged_zones

for db_zone in db.*; do
  #Strip db. from the string
  zone_stripped_of_db="$(echo "${db_zone}" | sed 's/^.\{3\}//')"

  echo $zone_stripped_of_db

  #Create new file under merged_zones
  touch merged_zones/"db."$zone_stripped_of_db
  #Remove old includes line
  grep -v '$INCLUDE' $db_zone  >> merged_zones/"db."$zone_stripped_of_db

  #try to find matching static zone and append it if exists
  static_zone="static."$zone_stripped_of_db

  if [ -f $static_zone ];
  then
     cat $static_zone >> merged_zones/"db."$zone_stripped_of_db

     echo "Successfully merged static and db zones of "$zone_stripped_of_db
  else
     echo "No matching static file found, copied original db zone to mergedzones folder"$zone_stripped_of_db
  fi
done
