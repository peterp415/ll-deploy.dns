---

# BIND deploy configuration for ns2-evdc.evdc.wavemarket.com

# Staging servers are:
#
# ns1-evdc     172.28.103.12  Master for evdc.wavemarket.com
# ns2-evdc     172.28.103.13

# Allow recursion, which now defaults to no
bind_config_recursion: "True"

# Zones we are slaving
bind_config_slave_zones:

  - name: evdc.wavemarket.com
    masters: [ '172.28.103.12' ]
    zones:
      - evdc.wavemarket.com

# Forwarded zones
bind_config_forward_zones:

  - name: domains forwarded from avg
    forwarders: [ '10.33.4.12', '10.32.162.11' ]
    forward: only
    zones:
      - grisoft.cz
      - avg.com
      - 10.in-addr.arpa
      - 200.168.192.in-addr.arpa
