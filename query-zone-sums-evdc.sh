#!/bin/bash

# List zones from dns servers and check zone data digest

for dnszone in evdc.wavemarket.com 172.IN-ADDR.ARPA ;do
  for dnssrv in ns1.evdc.wavemarket.com ns2.evdc.wavemarket.com ns1.engr.wavemarket.com ns2.engr.wavemarket.com ;do
    echo -n "${dnssrv} ${dnszone} : "
    ssh root@$dnssrv "host -l ${dnszone} localhost|md5sum ;echo \"rc=\${PIPESTATUS[0]}\""
  done
done
