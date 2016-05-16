#!/bin/bash
# Copy zone data from old DNS servers, process as necessary and
# create a directory of zone data suitable for deploying new DNS.

# Destination directory for downloaded zone files
dest_dir="./incoming-zones"
[ -d ${dest_dir} ] || mkdir ${dest_dir}
rm -rf ${dest_dir}/*

# Directory for deployable zone files
deploy_dir="./deploy-zones"
[ -d ${deploy_dir} ] || mkdir ${deploy_dir}
#rm -f ${deploy_dir}/*

#
# control.evdc  - EVDC zones
#
for current_server in control.evdc.wavemarket.com; do
    rsync -a root@$current_server:/etc/bind/zones/ ${dest_dir}/
done

control_zones="172.IN-ADDR.ARPA evdc.wavemarket.com"
# Copy to deploy dir
for z in ${control_zones}; do
	cp ${dest_dir}/$z ${deploy_dir}/db.$z
  # Replace all 'ns1-control.evdc.wavemarket.com.' with 'ns1.evdc.wavemarket.com.''
  sed -i -e 's/ns1-control.evdc.wavemarket.com./ns1.evdc.wavemarket.com./' -e 's/control.evdc.wavemarket.com./ns1.evdc.wavemarket.com./' ${deploy_dir}/db.$z
done

#
# base1.engr  - HQ zones
#
for current_server in base1.engr.wavemarket.com; do
    rsync -a root@$current_server:/var/lib/bind/masters/ ${dest_dir}/
    rsync -a root@$current_server:/var/lib/bind/slaves/  ${dest_dir}/
done

# Copy to deploy dir
base1_zones="38.10.in-addr.arpa
hq.locationlabs.com
hq.wavemarket.com
hq.ll
39.10.in-addr.arpa
evidc.locationlabs.com
evidc.wavemarket.com
evidc.ll
in.locationlabs.com
engr.wavemarket.com
locationlabs.com"
for z in ${base1_zones}; do
	cp ${dest_dir}/db.$z ${deploy_dir}/db.$z
  # Replace all 'base1.engr.wavemarket.com.' and 'hq-ad-1.engr.wavemarket.com.' with 'ns1.engr.wavemarket.com.''
  # and 'base2' with ns2
  sed -i -e 's/base1.engr.wavemarket.com./ns1.engr.wavemarket.com./' -e 's/base2.engr.wavemarket.com./ns2.engr.wavemarket.com./' ${deploy_dir}/db.$z
  sed -i -e 's/hq-ad-1.engr.wavemarket.com./ns1.engr.wavemarket.com./' -e 's/hq-ad-2.engr.wavemarket.com./ns2.engr.wavemarket.com./' ${deploy_dir}/db.$z
  # Also replace NS and SOA non-fqdn records
  sed -i -e '/NS/s/hq-ad-1/ns1/g' -e '/SOA/s/hq-ad-1/ns1/g' -e '/NS/s/hq-ad-2/ns2/g' -e '/SOA/s/hq-ad-2/ns2/g' ${deploy_dir}/db.$z
done
# Also need to add A record for ns1.locationlabs.com. which is the new NS for HQ locationlabs.com zone
#echo "ns1  IN A  192.168.2.19" >> ./deploy-zones/db.locationlabs.com

# Copy to DNS deploy directory
cp ${deploy_dir}/* ../masters/

# To see a diff, do:
# diff -r ./incoming-zones ./deploy-zones/
# diff incoming-zones/172.IN-ADDR.ARPA deploy-zones/db.172.IN-ADDR.ARPA
# diff incoming-zones/evdc.wavemarket.com deploy-zones/db.evdc.wavemarket.com
