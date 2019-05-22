## General notes on planned topology
- This design seeks to:
  - Be resilient and free of SPoFs
  - Strike a good balance between short replication paths and economy
    of replication overhead
  - Minimize amount of our infrastructure that must be directly
    touched by our deploy in order to update zone data. 
  - Use slaving instead for forwarding wherever possible to minimize
    change propagation delays within the world we control.
  - Not add to proliferation of firewall holes between silos

### SFDC
- Each silo corresponds to a subdomain and has a Bind cluster
  authoritative for that subdomain.
  - Current silos are:
    - ACI (aci.sfdc.wavemarket.com)
    - TFW (tfw.sfdc.wavemarket.com)
    - SFP (sfp.sfdc.wavemarket.com)
    - common (common.sfdc.wavemarket.com)
    - elder (sfdc.wavemarket.com)
    - public (locationlabs.com, wavemarket.com, others)
  - Most of these silos correspond to products.
  - elder is our vlan 66 legacy network
  - common is our shared infrastructure subdomain

#### Slaving relationships within SFDC
- Common slaves from all other silos
- Public allows common to slave its domains but does not slave
  anything from our private subdomains.
  interact with our private silos in any way.
- All other silos slave all subdomains from common, and not directly
  from each other.

#### Slaving relationships between SFDC and elsewhere
- Public allows slaving of our public domains by external DNS
  providers.
- Common allows slaving of all domains it knows about by both EVDC and
  HQ.

### EVDC
- Is authoritative for evdc.wavemarket.com and engr.wavemarket.com
- Forwards (does not slave) AVG zones. 
- Is responsible for split DNS for our public domains where zone
  contents diverge from the public-facing contents.
  - This is accomplished by populating the EVDC DNS with different
    zone data, and not through use of Bind views or the like. There
    should be a 1:1 relationship between hosts querying the EVDC DNS
    and hosts needing the "internal" view of our public domains.

### HQ
- Mirror of EVDC for SPoF mitigation.

### How this is supported
- see dnsvars.md

