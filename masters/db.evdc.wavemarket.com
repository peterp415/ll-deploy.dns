; DNS Staging testing zone file

$TTL    4h
$ORIGIN evdc.wavemarket.com.

@           IN      SOA     ns1-evdc.evdc.wavemarket.com. hostmaster.evdc.wavemarket.com. (

                            2016010100    ; Serial as YYYYMMDDss where ss is sequence number
                            1d            ; slave refresh (1 day)
                            2h            ; slave retry time in case of a problem (2 hours)
                            2w            ; slave expiration time (2 weeks)
                            2d            ; minimum caching time in case of failed lookups (2 days)y
                            )

            IN      NS      ns1-evdc.evdc.wavemarket.com.
            IN      NS      ns2-evdc.evdc.wavemarket.com.

ns1-common  IN A 172.28.103.10
ns2-common  IN A 172.28.103.11
ns1-evdc    IN A 172.28.103.12
ns2-evdc    IN A 172.28.103.13
