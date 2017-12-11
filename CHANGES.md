Release 1.2.1:
- Jumping to this version as we have older tags that confused me on the order
- `git log 1.0.0... --oneline`:
      bdea6cf (HEAD -> release/1.2.1, origin/develop, develop) IG-6571 Fixing to prode the correct dns servers to forward for ATT vpc
      4eda215 IG-6571 Adding fowarder to tools vpc from AFM
      ab362af IG-6570 Adding forwarding for dev.llabs.io from evdc env
      2166f12 IG-6531 Forward ott.llabs.io
      e48cc29 IG-6179
      036e618 apropos of IG-5820, make mgmt.evidc dns more widely accessible
      4c8547f IG-5974: IPs for vlan166 heartbeat for router1,2,-witness1.common
      9459c5e IG-6089
      f5e9cda IG-5907: remove 18.172.in-addr.arpa master zone as we forward these foAWS
      e41427b IG-5907: add a new zone
      31cb7b7 everyone loves (gitignore) boilerplate
      5bbdd16 IG-5985(ish) dns cleanup/backfill
      d6b1f53 Merge pull request #2 from ig/kube-dev-forwarding
      c4eced3 Adding forwarding for dev.llabs.io
      6546e3b Merge pull request #1 from ig/IG-5856_sprint-vpc
      06ff0b3 (origin/IG-5856_sprint-vpc, IG-5856_sprint-vpc) IG-5856: Adding forwarr for sprint vpc
      f09b8f1 IG-5850 Forward sprint-int.llabs.io to AWS tools DNS
      626296d IG-5785: forwarding for prov.itlab.hq also
      1ec852b IG-5715 forward queries for mgmt.itlab.hq zone to the itlab managementerver front-side IP
      817c328 IG-5715 forward queries for mgmt.hq zone to the hq management server fnt-side IP
      3174e7c IG-5775: forward vzw.llabs.io to the dns servers in the aws-tools vpc
      3c77c30 IG-5740 - Point tools.llabs.io at DNS servers in new AWS tools VPC
      23ed2c6 apropos of IG-5373/IG-5375, add reverse zone for loopbacks in hq/evdc/idc
      9b0ebbc track dependency changes
      d37ff2a (apropos of IG-5474) moar PTR!
      a896edc backward-compatibility ssh fix for 14.04 courtesy of peter.pletcher@lotionlabs.com

Release 1.0.0:
- Let's make a release of what we use to deploy DNS BAUs many times per week.
