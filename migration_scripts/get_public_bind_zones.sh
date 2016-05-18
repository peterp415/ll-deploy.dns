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
# ns3.wavemarket.com - Public DNS zones
#
for current_server in ns3.wavemarket.com; do
    rsync -a root@$current_server:/etc/bind/zones/ ${dest_dir}/
done

ns3_zones="familytabs safely locationlabs"
# Copy to deploy dir
for z in ${ns3_zones}; do
	cp ${dest_dir}/$z ${deploy_dir}/db.$z
  # Replace all 'ns3.wavemarket.com.' with 'ns1.wavemarket.com.''
  sed -i -e 's/ns3.wavemarket.com./ns1.wavemarket.com./' -e 's/lvs3.sfdc.wavemarket.com./ns2.wavemarket.com./' -e 's/lvs4.sfdc.wavemarket.com./ns2.wavemarket.com./' ${deploy_dir}/db.$z
done

# Copy to DNS deploy directory
cp ${deploy_dir}/* ../masters/

