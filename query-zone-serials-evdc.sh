#!/bin/bash

# Query dns servers for the SOA serial in each zone

# EVDC
for dnszone in evdc.wavemarket.com 172.IN-ADDR.ARPA ;do
  for dnssrv in ns1.evdc.wavemarket.com ns2.evdc.wavemarket.com ns1.engr.wavemarket.com ns2.engr.wavemarket.com ;do
    echo -n "${dnssrv} ${dnszone} : " ; dig @${dnssrv} -t soa +short ${dnszone} 2>/dev/null | awk '{print $3}'
  done
done
# HQ
for dnszone in engr.wavemarket.com locationlabs.com ;do
  for dnssrv in ns1.evdc.wavemarket.com ns2.evdc.wavemarket.com ns1.engr.wavemarket.com ns2.engr.wavemarket.com ;do
    echo -n "${dnssrv} ${dnszone} : " ; dig @${dnssrv} -t soa +short ${dnszone} 2>/dev/null | awk '{print $3}'
  done
done
