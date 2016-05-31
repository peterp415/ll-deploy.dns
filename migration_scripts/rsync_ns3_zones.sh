#!/bin/bash
# Copy zone data from old DNS servers, process as necessary and
# create a directory of zone data suitable for deploying new DNS.

# Destination directory for downloaded zone files
dest_dir="ns3_zones"
deploy_dir="ns3_zones_modified"
[ -d ${dest_dir} ] || mkdir ${dest_dir}
rm -rf ${dest_dir}/*

#
# ns3
#

# Grab and rename all the zones NS3 is master of and rename them to db.$Correct_Zone_Name
rsync -a root@ns3:/etc/bind/zones/69.25.109 ${dest_dir}/db.109.25.69.in-addr.arpa
rsync -a root@ns3:/etc/bind/zones/64.164.31.128 ${dest_dir}/db.128.31.164.64.in-addr.arpa
rsync -a root@ns3:/etc/bind/zones/66.211.104.128 ${dest_dir}/db.128-25.104.211.66.in-addr.arpa
rsync -a root@ns3:/etc/bind/zones/familytabs ${dest_dir}/db.familytabs.com
rsync -a root@ns3:/etc/bind/zones/safely ${dest_dir}/db.safely.com
rsync -a root@ns3:/etc/bind/zones/attchk.in ${dest_dir}/db.attchk.in
rsync -a root@ns3:/etc/bind/zones/sfly.co ${dest_dir}/db.sfly.co
rsync -a root@ns3:/etc/bind/zones/becn.io ${dest_dir}/db.becn.io
rsync -a root@ns3:/etc/bind/zones/amberbuddy ${dest_dir}/db.amberbuddy.com
rsync -a root@ns3:/etc/bind/zones/locationlabs ${dest_dir}/db.locationlabs.com
rsync -a root@ns3:/etc/bind/zones/locationlabs ${dest_dir}/db.location-labs.com
rsync -a root@ns3:/etc/bind/zones/mayormaker ${dest_dir}/db.mayormaker.com
rsync -a root@ns3:/etc/bind/zones/tmo.fm ${dest_dir}/db.tmo.fm
rsync -a root@ns3:/etc/bind/zones/tweetmover ${dest_dir}/db.tweetmover.com
rsync -a root@ns3:/etc/bind/zones/wavemarket.com ${dest_dir}/db.wavemarket.com
rsync -a root@ns3:/etc/bind/zones/wvmrkt.com ${dest_dir}/db.wvmrkt.com
rsync -a root@ns3:/etc/bind/zones/amberhero ${dest_dir}/db.amberhero.com
rsync -a root@ns3:/etc/bind/zones/axcessfamilyfinder ${dest_dir}/db.axcessfamilyfinder.com
rsync -a root@ns3:/etc/bind/zones/alltelfamilyfinder ${dest_dir}/db.alltelfamilyfinder.com
rsync -a root@ns3:/etc/bind/zones/attfamilyfinder ${dest_dir}/db.attfamilyfinder.com
rsync -a root@ns3:/etc/bind/zones/attfamilymap ${dest_dir}/db.attfamilymap.com
rsync -a root@ns3:/etc/bind/zones/attfm ${dest_dir}/db.att.fm
rsync -a root@ns3:/etc/bind/zones/bellseek ${dest_dir}/db.Bellchercherettrouver.com
rsync -a root@ns3:/etc/bind/zones/bellseek ${dest_dir}/db.Bellseekandfind.ca
rsync -a root@ns3:/etc/bind/zones/bellseek ${dest_dir}/db.Bellseekandfind.com
rsync -a root@ns3:/etc/bind/zones/sflmobile ${dest_dir}/db.sflmobile.com
rsync -a root@ns3:/etc/bind/zones/veriplace ${dest_dir}/db.veriplace.com
rsync -a root@ns3:/etc/bind/zones/veriplace ${dest_dir}/db.veriplace.net
rsync -a root@ns3:/etc/bind/zones/vivo ${dest_dir}/db.vivolocalizafamilia.com.br
rsync -a root@ns3:/etc/bind/zones/temp ${dest_dir}/db.FBCURRENTCITY.COM
rsync -a root@ns3:/etc/bind/zones/temp ${dest_dir}/db.sharewhereiam.com
rsync -a root@ns3:/etc/bind/zones/temp ${dest_dir}/db.roadtripapp.com
rsync -a root@ns3:/etc/bind/zones/temp ${dest_dir}/db.tweetmycity.org
rsync -a root@ns3:/etc/bind/zones/temp ${dest_dir}/db.gettingwarmergame.com
rsync -a root@ns3:/etc/bind/zones/littlebuddymobile ${dest_dir}/db.littlebuddymobile.com
rsync -a root@ns3:/etc/bind/zones/tmofamilywhere ${dest_dir}/db.T-MobileFamilyWhere.com
rsync -a root@ns3:/etc/bind/zones/sprintdrivefirst ${dest_dir}/db.sprintdrivefirst.com
rsync -a root@ns3:/etc/bind/zones/drivesmartplus ${dest_dir}/db.drivesmartplus.com
rsync -a root@ns3:/etc/bind/zones/sprintmobilecontrol ${dest_dir}/db.sprintmobilecontrol.com

# Get the ancillary zone files
rsync -a root@ns3:/etc/bind/zones/mailrecords-direct.include ${dest_dir}/mailrecords-direct.include
rsync -a root@ns3:/etc/bind/zones/multi ${dest_dir}/multi
rsync -a root@ns3:/etc/bind/zones/ec2 ${dest_dir}/ec2
rsync -a root@ns3:/etc/bind/zones/e-locationlabs.save ${dest_dir}/e-locationlabs.save
rsync -a root@ns3:/etc/bind/zones/mailrecords.include ${dest_dir}/mailrecords.include


cd ns3_zones

#replace anything ns3 with
sed -i -e '/SOA/s/ns3.wavemarket.com/ns1.wavemarket.com/g' *

# Copy to DNS deploy directory
#cp ${deploy_dir}/* ../masters/
