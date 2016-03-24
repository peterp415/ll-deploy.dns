---

# BIND deploy configuration for ns1-evdc.evdc.wavemarket.com

# Staging servers are:
#
# ns1-evdc     172.28.103.12  Master for evdc.wavemarket.com
# ns2-evdc     172.28.103.13

# Zones we are master for
bind_config_master_zones:
  - name: evdc.wavemarket.com

# Servers who slave from us
# TODO: Get IPs of hosts via Ansible setup data
bind_config_master_allow_transfer:
  - '172.28.103.13'
