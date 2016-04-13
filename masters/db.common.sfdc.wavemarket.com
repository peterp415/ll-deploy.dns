; Vagrant testing zone file

$TTL    4h
$ORIGIN common.sfdc.wavemarket.com.

@           IN      SOA     ns1-common.evdc.wavemarket.com. hostmaster.common.sfdc.wavemarket.com. (

                            2016010100    ; Serial as YYYYMMDDss where ss is sequence number
                            1d            ; slave refresh (1 day)
                            2h            ; slave retry time in case of a problem (2 hours)
                            2w            ; slave expiration time (2 weeks)
                            2d            ; minimum caching time in case of failed lookups (2 days)y
                            )

            IN      NS      ns1-common.evdc.wavemarket.com.
            IN      NS      ns2-common.evdc.wavemarket.com.

ns1         IN A 172.28.103.10
ns2         IN A 172.28.103.11

