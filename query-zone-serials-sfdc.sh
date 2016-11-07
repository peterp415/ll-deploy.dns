#!/bin/bash

# Query dns servers for the SOA serial in each zone

# SFDC
for dnszone in sfdc.wavemarket.com ;do
  for dnssrv in ns1.sfdc.wavemarket.com ns2.sfdc.wavemarket.com ns{1,2}.{common,aci,afm,sfp,tfw}.sfdc.wavemarket.com ;do
    echo -n "${dnssrv} ${dnszone} : " ; ssh root@${dnssrv} "dig @localhost -t soa +short ${dnszone} 2>/dev/null" | awk '{print $3}'
  done
done
