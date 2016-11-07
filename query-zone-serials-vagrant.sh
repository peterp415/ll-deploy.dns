#!/bin/bash

# Query dns servers for the SOA serial in each zone

for dnszone in sfdc.vagrant aci.sfdc.vagrant ;do
  for dnssrv in ns1.common.sfdc.vagrant ns2.common.sfdc.vagrant ;do
    echo -n "${dnssrv} ${dnszone} " ; vagrant ssh -c "dig @localhost -t soa +short ${dnszone}" ${dnssrv} 2>/dev/null | awk '{print $3}'
  done
done
