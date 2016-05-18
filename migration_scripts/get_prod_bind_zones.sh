#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

OUTPUT_DIR="${SCRIPT_DIR}/prod_zone_output"
[ -d "${OUTPUT_DIR}" ] && rm -rf ${OUTPUT_DIR}/*
mkdir -p ${OUTPUT_DIR}

#
# cobbler.common zones
#
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

  echo "${zone_stripped_of_db}" | grep -q '[0-9]'
  if [ $? == 0 ]; then
    # turn e.g. db.10.208.1 into db.1.208.10.in-addr.arpa
    output_file=$(echo ${db_zone} | awk -F'.' 'NF==4 {print "db",$4,$3,$2,"in-addr.arpa"}' OFS='.')
  else
    output_file=$db_zone
  fi
  if [ -z "$output_file" ]; then continue; fi

  echo $zone_stripped_of_db

  #Create new file under merged_zones
  touch merged_zones/$output_file
  #Remove old includes line
  grep -v '$INCLUDE' $db_zone  >> merged_zones/$output_file

  #try to find matching static zone and append it if exists
  static_zone="static."$zone_stripped_of_db

  if [ -f $static_zone ];
  then
    cat $static_zone >> merged_zones/$output_file

     echo "Successfully merged static and db zones of "$zone_stripped_of_db
  else
     echo "No matching static file found, copied original db zone to mergedzones folder"$zone_stripped_of_db
  fi
done

# Fix NS and SOA for AFM zones
for f in db.0.211.10.in-addr.arpa db.1.211.10.in-addr.arpa db.2.211.10.in-addr.arpa db.3.211.10.in-addr.arpa db.4.211.10.in-addr.arpa db.5.211.10.in-addr.arpa db.6.211.10.in-addr.arpa db.7.211.10.in-addr.arpa db.afm.sfdc.wavemarket.com ; do
  sed -i -e '/SOA/s/10.252.20.11./ns1.afm.sfdc.wavemarket.com./g' -e '/SOA/s/cobbler.common.sfdc.wavemarket.com./ns1.afm.sfdc.wavemarket.com./g' -e '/NS/s/10.252.20.11./ns1.afm.sfdc.wavemarket.com./g' merged_zones/$f
  # Add second NS record
  sed -i -e '/NS.*ns1/a\                        IN      NS      ns2.afm.sfdc.wavemarket.com.' merged_zones/$f
  cp -i merged_zones/$f $OUTPUT_DIR/
done
# Fix NS and SOA for SFP zones
for f in db.0.208.10.in-addr.arpa db.1.208.10.in-addr.arpa db.2.208.10.in-addr.arpa db.3.208.10.in-addr.arpa db.4.208.10.in-addr.arpa db.5.208.10.in-addr.arpa db.6.208.10.in-addr.arpa db.sfp.sfdc.wavemarket.com ; do
  sed -i -e '/SOA/s/10.252.20.11./ns1.sfp.sfdc.wavemarket.com./g' -e '/SOA/s/cobbler.common.sfdc.wavemarket.com./ns1.sfp.sfdc.wavemarket.com./g' -e '/NS/s/10.252.20.11./ns1.sfp.sfdc.wavemarket.com./g' merged_zones/$f
  # Add second NS record
  sed -i -e '/NS.*ns1/a\                        IN      NS      ns2.sfp.sfdc.wavemarket.com.' merged_zones/$f
  cp -i merged_zones/$f $OUTPUT_DIR/
done
# Fix NS and SOA for TFW zones
for f in db.0.209.10.in-addr.arpa db.1.209.10.in-addr.arpa db.2.209.10.in-addr.arpa db.3.209.10.in-addr.arpa db.4.209.10.in-addr.arpa db.5.209.10.in-addr.arpa db.6.209.10.in-addr.arpa db.7.209.10.in-addr.arpa db.tfw.sfdc.wavemarket.com ; do
  sed -i -e '/SOA/s/10.252.20.11./ns1.tfw.sfdc.wavemarket.com./g' -e '/SOA/s/cobbler.common.sfdc.wavemarket.com./ns1.tfw.sfdc.wavemarket.com./g' -e '/NS/s/10.252.20.11./ns1.tfw.sfdc.wavemarket.com./g' merged_zones/$f
  # Add second NS record
  sed -i -e '/NS.*ns1/a\                        IN      NS      ns2.tfw.sfdc.wavemarket.com.' merged_zones/$f
  cp -i merged_zones/$f $OUTPUT_DIR/
done
# Fix NS and SOA for common zones, dw and att
for f in db.0.252.10.in-addr.arpa db.1.252.10.in-addr.arpa db.2.252.10.in-addr.arpa db.3.252.10.in-addr.arpa db.4.252.10.in-addr.arpa db.5.252.10.in-addr.arpa db.6.252.10.in-addr.arpa db.7.252.10.in-addr.arpa db.20.252.10.in-addr.arpa db.common.sfdc.wavemarket.com db.dw.sfdc.wavemarket.com db.att.sfdc.wavemarket.com; do
  sed -i -e '/SOA/s/10.252.20.11./ns1.common.sfdc.wavemarket.com./g' -e '/SOA/s/cobbler.common.sfdc.wavemarket.com./ns1.common.sfdc.wavemarket.com./g' -e '/NS/s/10.252.20.11./ns1.common.sfdc.wavemarket.com./g' merged_zones/$f
  # Add second NS record
  sed -i -e '/NS.*ns1/a\                        IN      NS      ns2.common.sfdc.wavemarket.com.' merged_zones/$f
  cp -i merged_zones/$f $OUTPUT_DIR/
done
# Fix NS and SOA for sfdc zones
for f in db.sfdc.wavemarket.com; do
  sed -i -e '/SOA/s/10.252.20.11./ns1.sfdc.wavemarket.com./g' -e '/SOA/s/cobbler.sfdc.wavemarket.com./ns1.sfdc.wavemarket.com./g' -e '/NS/s/10.252.20.11./ns1/g' merged_zones/$f
  # Add second NS record
  sed -i -e '/NS.*ns1/a\                        IN      NS      ns2' merged_zones/$f
  cp -i merged_zones/$f $OUTPUT_DIR/${f}.cobbler
done

cd ..

#
# aci-cobbler1.aci zones
#
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

  echo "${zone_stripped_of_db}" | grep -q '[0-9]'
  if [ $? == 0 ]; then
    # turn e.g. db.10.208.1 into db.1.208.10.in-addr.arpa
    output_file=$(echo ${db_zone} | awk -F'.' 'NF==4 {print "db",$4,$3,$2,"in-addr.arpa"}' OFS='.')
  else
    output_file=$db_zone
  fi
  if [ -z "$output_file" ]; then continue; fi

  echo $zone_stripped_of_db

  #Create new file under merged_zones
  touch merged_zones/$output_file
  #Remove old includes line
  grep -v '$INCLUDE' $db_zone  >> merged_zones/$output_file

  #try to find matching static zone and append it if exists
  static_zone="static."$zone_stripped_of_db

  if [ -f $static_zone ];
  then
    cat $static_zone >> merged_zones/$output_file

     echo "Successfully merged static and db zones of "$zone_stripped_of_db
  else
     echo "No matching static file found, copied original db zone to mergedzones folder"$zone_stripped_of_db
  fi
done

# Fix NS and SOA for ACI zones
for f in db.0.207.10.in-addr.arpa db.1.207.10.in-addr.arpa db.2.207.10.in-addr.arpa db.3.207.10.in-addr.arpa db.4.207.10.in-addr.arpa db.5.207.10.in-addr.arpa db.6.207.10.in-addr.arpa db.7.207.10.in-addr.arpa db.aci.sfdc.wavemarket.com ; do
  sed -i -e '/SOA/s/10.207.4.11./ns1.aci.sfdc.wavemarket.com./g' -e '/SOA/s/aci-cobbler1/ns1.aci.sfdc.wavemarket.com./g' -e '/NS/s/10.207.4.11./ns1.aci.sfdc.wavemarket.com./g' merged_zones/$f
  # Add second NS record
  sed -i -e '/NS.*ns1/a\                        IN      NS      ns2.aci.sfdc.wavemarket.com.' merged_zones/$f
  cp -i merged_zones/$f $OUTPUT_DIR/
done

cd ..

#
# ns5 zones
#
if [ -d ns5_zones ]; then
  rm -rf ns5_zones
fi

mkdir ns5_zones

# Copy masters to local files with correct name
scp root@ns5.sfdc.wavemarket.com:/etc/bind/zones/10.x.x.x            ns5_zones/db.10.in-addr.arpa
scp root@ns5.sfdc.wavemarket.com:/etc/bind/zones/sfdc.wavemarket.com ns5_zones/db.sfdc.wavemarket.com

cd ns5_zones

cp db.sfdc.wavemarket.com db.sfdc.wavemarket.com.orig
# Fix SOA record
sed -i -e '/SOA/s/ns5.sfdc.wavemarket.com./ns1.sfdc.wavemarket.com./g' db.sfdc.wavemarket.com
# Remove IN NS ns5
sed -i -e '/IN.*NS.*ns5/d' db.sfdc.wavemarket.com
# Update ns1,ns2 IN A to new server IPs
sed -i -e 's/^ns1.*IN.*A.*/ns1\    IN    A    10.249.5.12/' -e 's/^ns2.*IN.*A.*/ns2\    IN    A    10.249.5.13/' db.sfdc.wavemarket.com
# Remove ns4 IN A
sed -i -e '/ns4.*IN.*A/d' db.sfdc.wavemarket.com
cp -i db.sfdc.wavemarket.com $OUTPUT_DIR/

cp db.10.in-addr.arpa db.10.in-addr.arpa.orig
# Fix SOA record
sed -i -e '/SOA/s/approx.sfdc.wavemarket.com./ns1.sfdc.wavemarket.com./g' db.10.in-addr.arpa
sed -i -e '/NS/s/lvs1.sfdc.wavemarket.com./ns1.sfdc.wavemarket.com./g' -e '/NS/s/lvs2.sfdc.wavemarket.com./ns2.sfdc.wavemarket.com./g'  db.10.in-addr.arpa
cp -i db.10.in-addr.arpa $OUTPUT_DIR/

cd ..

echo
echo "Final zone files are in ${OUTPUT_DIR}"
echo
echo "NOTE: Duplicate sfdc zone files need to be merged manually:"
echo "  Merge ${OUTPUT_DIR}/db.sfdc.wavemarket.com.cobbler (from cobbler, mostly oob entries)"
echo "  Into  ${OUTPUT_DIR}/db.sfdc.wavemarket.com"

