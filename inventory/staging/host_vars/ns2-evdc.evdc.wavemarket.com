---

# BIND deploy configuration for ns2-evdc.evdc.wavemarket.com

# Staging servers are:
#
# ns1-evdc     172.28.103.12  Master for evdc.wavemarket.com
# ns2-evdc     172.28.103.13

# Zones we are slaving
bind_config_slave_zones:

  - name: evdc.wavemarket.com
    masters: [ '172.28.103.12' ]
    zones:
      - evdc.wavemarket.com
