; Vagrant testing zone file

$TTL    4h

@           IN      SOA     vagrant.example.com. (

                            2016010100    ; Serial
                            1d            ; slave refresh (1 day)
                            2h            ; slave retry time in case of a problem (2 hours)
                            2w            ; slave expiration time (2 weeks)
                            2d            ; minimum caching time in case of failed lookups (2 days)y
                            )

            IN      NS      dns1.vagrant.example.com.
            IN      NS      dns2.vagrant.example.com.
