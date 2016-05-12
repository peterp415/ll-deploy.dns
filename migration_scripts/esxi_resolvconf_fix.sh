#!/bin/bash

esxi_dmz_servers="esxi-dmz.evdc.wavemarket.com
esxi-dmz2.evdc.wavemarket.com
esxi-dmz3.evdc.wavemarket.com
esxi-dmz4.evdc.wavemarket.com
esxi-dmz5.evdc.wavemarket.com
esxi-dmz6.evdc.wavemarket.com
esxi-dmz7.evdc.wavemarket.com
esxi-dmz9.evdc.wavemarket.com
esxi-dmz10.evdc.wavemarket.com
esxi-dmz11.evdc.wavemarket.com
esxi-dmz12.evdc.wavemarket.com
esxi-dmz13.evdc.wavemarket.com
esxi-dmz17.evdc.wavemarket.com
esxi-dmz18.evdc.wavemarket.com
esxi-dmz20.evdc.wavemarket.com
esxi-dmz21.evdc.wavemarket.com
esxi-dmz22.evdc.wavemarket.com
esxi-dmz23.evdc.wavemarket.com
esxi-dmz24.evdc.wavemarket.com
esxi-dmz25.evdc.wavemarket.com
esxi-dmz26.evdc.wavemarket.com
esxi-dmz27.evdc.wavemarket.com
esxi-dmz28.evdc.wavemarket.com
esxi-dmz29.evdc.wavemarket.com
esxi-dmz30.evdc.wavemarket.com
esxi-dmz31.evdc.wavemarket.com
esxi-dmz32.evdc.wavemarket.com
esxi-dmz33.evdc.wavemarket.com"

# Backup existing resolv.conf
for current_server in $esxi_dmz_servers; do
    ssh root@$current_server "cp /etc/resolv.conf /etc/resolv.conf.IG-1959"
done

# Push new resolv.conf
for current_server in $esxi_dmz_servers; do
    scp esxi-dmz-resolv.conf root@$current_server:/etc/resolv.conf
done

