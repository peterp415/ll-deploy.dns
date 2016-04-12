$TTL 2h
@       7d IN SOA control.evdc.wavemarket.com. sa.wavemarket.com. (
            2016031002 ; serial number - yyyymmddss
            1d         ; refresh: query master
            1h         ; retry: wait after failure to contact master
            28d        ; expire: stay authoritative for this long if we can't contact master
            300s       ; negative answer cache ttl (rfc 2038): how long to cache negative responses
        )

;
; Zone NS Records
;

@       IN NS ns1

;
; Zone MX Records
;


;
; Zone Records
;

router        IN A 172.24.0.1
control       IN A 172.24.0.10
; control-old IN A 172.24.0.91
ns1           IN A 172.24.0.10

; router vips
router-dmz-in  IN A 172.24.0.1
router-dmz-out IN A 66.211.99.52
router-dmz-dmz IN A 66.211.104.129

; real ips
router-dmz1-eth0 IN A 172.24.0.6
router-dmz1-in   IN CNAME router-dmz1-eth0
router-dmz1      IN CNAME router-dmz1-in
router-dmz1-ilo	IN	A	172.25.0.6
; the -dmz ips live on eth0 too, unfortunately
router-dmz1-dmz  IN A 66.211.104.227
router-dmz1-eth1 IN A 66.211.99.53
router-dmz1-out  IN CNAME router-dmz1-eth1
router-dmz1-eth3 IN A 10.10.10.1

router-dmz2-eth0 IN A 172.24.0.7
router-dmz2-in   IN CNAME router-dmz2-eth0
router-dmz2      IN CNAME router-dmz2-in
router-dmz2-ilo	IN	A	172.25.0.7
router-dmz2-dmz  IN A 66.211.104.228
router-dmz2-eth1 IN A 66.211.99.54
router-dmz2-out  IN CNAME router-dmz2-eth1
router-dmz2-eth3 IN A 10.10.10.2

; core
core1            IN A 172.24.0.240
core1-vlan6      IN CNAME core1
core2            IN A 172.24.0.241
core2-vlan6      IN CNAME core2

; tors
r1-tor1          IN A 172.24.0.242
r1-tor2          IN A 172.24.0.243
r2-tor1          IN A 172.24.0.244
r2-tor2          IN A 172.24.0.245
r3-tor1          IN A 172.24.0.246
r3-tor2          IN A 172.24.0.247
r4-tor1          IN A 172.24.0.248
r4-tor2          IN A 172.24.0.249
r5-tor1          IN A 172.24.0.250
r5-tor2          IN A 172.24.0.251

; hv-dmz
hv-dmz1		IN	A	172.24.1.1
hv-dmz2		IN	A	172.24.1.2
hv-dmz3		IN	A	172.24.1.3
hv-dmz4		IN	A	172.24.1.4
hv-dmz5		IN	A	172.24.1.5
hv-dmz6		IN	A	172.24.1.6
hv-dmz7		IN	A	172.24.1.7
;; hv-dmz8 was taken to SFDC - mpfaffroth
;; hv-dmz8		IN	A	172.24.1.8
hv-dmz9		IN	A	172.24.1.9
hv-dmz10	IN	A	172.24.1.10
hv-dmz11	IN	A	172.24.1.11
hv-dmz12	IN	A	172.24.1.12
hv-dmz13	IN	A	172.24.1.13
hv-dmz14	IN	A	172.24.1.14
hv-dmz15	IN	A	172.24.1.15
hv-dmz16	IN	A	172.24.1.16
hv-dmz17	IN	A	172.24.1.17

;; SSD  Sandbox IG-1485
hv-ssd1		IN	A	172.24.5.1


;; hv-dmz oob
hv-dmz14.oob	IN	A	172.24.2.14

git     IN  A   172.24.0.92
precise-fai-dmz     IN  A   172.24.0.9
trusty-manual     IN  A   172.24.0.60
trusty-test     IN  A   172.24.0.61
approx      IN  A   172.24.0.9
apt-cache1	IN	A	172.24.0.53
apt-cacher      IN  CNAME   apt-cache1
att-esl-demo    IN  A   172.26.188.1
cte-db1     IN  A   172.28.100.1
cte-db2     IN  A   172.28.100.2
cte-db3     IN  A   172.28.100.3
cte-db4     IN  A   172.28.100.4
cte-web1        IN  A   172.26.100.1
cte-web2        IN  A   172.26.100.2
cte-web3        IN  A   172.26.100.3
cte-web4        IN  A   172.26.100.4
cte-web5        IN  A   172.26.100.5
cte-web6        IN  A   172.26.100.6
cte-web7        IN  A   172.26.100.7
cte-web8        IN  A   172.26.100.8
cte-web9        IN  A   172.26.100.9
cte-web10       IN  A   172.26.100.10
cte-web11       IN  A   172.26.100.11
cte-web12       IN  A   172.26.100.12
cte-web13       IN  A   172.26.100.13
cte-web14       IN  A   172.26.100.14
cte-web15       IN  A   172.26.100.15
cte-web16       IN  A   172.26.100.16
cte-mail        IN  A   172.26.200.10
cte-mail1       IN  A   172.26.200.1
cte-mail2       IN  A   172.26.200.2
cte-monitor1        IN  A   172.26.109.1
cte-testcontrol1        IN  A   172.26.111.1
vci-testcontrol1        IN  A   172.26.111.2
test-auto1      IN  A   172.26.111.100
cte-event1      IN  A   172.26.100.254
cte-event2      IN  A   172.26.100.253
cte-event3      IN  A   172.26.100.252
cte-hsdb1       IN  A   172.28.101.1
cte-hsdb-1      IN  A   172.28.101.1
cte-hsdb2       IN  A   172.28.101.2
cte-hsdb3       IN  A   172.28.101.3
cte-hsdb4       IN  A   172.28.101.4
cte-hsdb5       IN  A   172.28.101.5
cte-hsdb6       IN  A   172.28.101.6
cte-hsdb7       IN  A   172.28.101.7
cte-perf1       IN  A   172.26.100.100
cte-perf2       IN  A   172.26.100.101
cte-perf3       IN  A   172.26.100.102
cte-perf4       IN  A   172.26.100.103
cte-perf5       IN  A   172.26.100.104
cte-perf6       IN  A   172.26.100.105
cte-perf7       IN  A   172.26.100.106
cte-perf8       IN  A   172.26.100.107
cte-perf9       IN  A   172.26.100.108
cte-perf10      IN  A   172.26.100.109
cte-perf11      IN  A   172.26.100.110
cte-perf12      IN  A   172.26.100.111
debrepo         IN  CNAME   precise-fai-dmz
elephant-cte        IN  A   66.211.104.164
elephant-lvs-cte        IN  A   172.26.164.100
elephant-lvs-cte1       IN  A   172.26.164.101
elephant-lvs-cte2       IN  A   172.26.164.102
elephant-cte1       IN  A   172.26.164.1
elephant-cte2       IN  A   172.26.164.2
elephant-stable     IN  A   172.26.165.2
elephant-dev        IN  A   66.211.104.186
cni-android-reg     IN  A   172.26.44.1
cni-android-dev     IN  A   172.26.44.2
esxi-dmz        IN  A   172.24.0.11
esxi-dmz2       IN  A   172.24.0.12
esxi-dmz3       IN  A   172.24.0.13
esxi-dmz4       IN  A   172.24.0.14
esxi-dmz5       IN  A   172.24.0.15
esxi-dmz6       IN  A   172.24.0.16
esxi-dmz7       IN  A   172.24.0.17
esxi-dmz8       IN  A   172.24.0.18
esxi-dmz9       IN  A   172.24.0.19
esxi-dmz10      IN  A   172.24.0.20
esxi-dmz11      IN  A   172.24.0.21
esxi-dmz12      IN  A   172.24.0.22
esxi-dmz13      IN  A   172.24.0.23
;esxi-dmz15      IN  A   172.24.0.25 - see IG-532, probably safe to remove
;esxi-dmz16      IN  A   172.24.0.26 - see IG-532, probably safe to remove
esxi-dmz17      IN  A   172.24.0.27
esxi-dmz18      IN  A   172.24.0.28
;esxi-dmz19      IN  A   172.24.0.29 - see IG-532, probably safe to remove
esxi-dmz20      IN  A   172.24.0.30
esxi-dmz21      IN  A   172.24.0.31
esxi-dmz22      IN  A   172.24.0.32
esxi-dmz23      IN  A   172.24.0.33
esxi-dmz24      IN  A   172.24.0.34
esxi-dmz25      IN  A   172.24.0.35
esxi-dmz26      IN  A   172.24.0.36
esxi-dmz27      IN  A   172.24.0.37
esxi-auto-test      IN  CNAME   esxi-dmz28
esxi-dmz28      IN  A   172.24.0.38
esxi-dmz29      IN  A   172.24.0.39
esxi-dmz30      IN  A   172.24.0.40
esxi-dmz31      IN  A   172.24.0.41
esxi-dmz32      IN  A   172.24.0.42
;; these are not (yet) in existence, but are on hq-ad-{1,2}, so let's put them here in the interest of compatibility
esxi-dmz33      IN  A   172.24.0.43
; 33 should be the last one - hv-dmz is the way to go from here on out IG-532
; esxi-dmz34      IN  A   172.24.0.44
; esxi-dmz35      IN  A   172.24.0.45
aci-esxi1       IN  A   172.27.0.101
aci-esxi2       IN  A   172.27.0.102
aci-esxi3       IN  A   172.27.0.103
aci-esxi4       IN  A   172.27.0.104
aci-esxi5       IN  A   172.27.0.105
aci-esxi6       IN  A   172.27.0.106
aci-esxi7       IN  A   172.27.0.107
aci-esxi8       IN  A   172.27.0.108
aci-esxi9       IN  A   172.27.0.109
aci-cte-core-db-green   IN  A   172.27.0.10
aci-cte-contact-db-green    IN  A   172.27.0.12
aci-cte-core-db-red   IN  A   172.27.0.14
aci-cte-core-db-orange   IN  A   172.27.0.15
aci-cte-hsdb1-green IN  A   172.27.0.20
aci-cte-hsdb2-green IN  A   172.27.0.22
aci-cte-hsdb3-green IN  A   172.27.0.24
aci-cte-hsdb4-green IN  A   172.27.0.26
aci-cte-core-db IN A 172.27.0.40
aci-cte-contact-db IN A 172.27.0.41
aci-cte-hsdb1 IN A 172.27.0.42
aci-cte-hsdb2 IN A 172.27.0.43
aci-cte-hsdb3 IN A 172.27.0.44
aci-cte-hsdb4 IN A 172.27.0.45
hourglass       IN  A   172.28.35.1
repo            IN  A   10.39.4.102
jira            IN  A   10.39.4.102
stash           IN  A   10.39.4.102
tools-consul1	IN	A	10.39.4.31
tools-consul2	IN	A	10.39.4.32
tools-mon1	IN  A   172.24.0.54
asset-tracking-prod	IN	A	10.39.4.203
deploy-tools-staging	IN	A	172.24.0.56

;; IG-1385
tools-nagios	IN	A	10.39.4.33

;; IG-195 
latest-cni      IN  A   172.26.22.27
latest-verizon      IN  A   172.26.22.28
latest-sprint-retail        IN  A   172.26.23.1
vci-scale-hs-query      IN  A   172.28.101.254
vci-scale-hs-write      IN  A   172.28.101.254
vci-scale-hs-api1       IN  A   172.28.101.11
vci-scale-hs-api2       IN  A   172.28.101.12
vci-scale-hs-api3       IN  A   172.28.101.13
vci-scale-hs-api4       IN  A   172.28.101.14
vci-scale-hs-api5       IN  A   172.28.101.15
vci-scale-hs-api6       IN  A   172.28.101.16
vci-scale-hs-api7       IN  A   172.28.101.17
vci-scale-hs-api8       IN  A   172.28.101.18
vci-scale-mock1     IN  A   172.28.101.100
vci-scale3-mock2     IN  A   172.28.101.101
vci-scale-hs1       IN  A   172.26.101.1
vci-scale-core1     IN  A   172.26.102.1
vci-scale-int1      IN  A   172.26.103.1
vci-scale-hs2       IN  A   172.26.101.2
vci-scale-core2     IN  A   172.26.102.2
vci-scale-int2      IN  A   172.26.103.2
vci-scale-hs3       IN  A   172.26.101.3
vci-scale-core3     IN  A   172.26.102.3
vci-scale-int3      IN  A   172.26.103.3
vci-scale-seti      IN  A   172.28.45.254
vci-scale-seti1     IN  A   172.28.45.1
vci-scale-seti2     IN  A   172.28.45.2
vci-scale-seti3     IN  A   172.28.45.3
vci-scale-seti-api1	IN	A	172.28.45.41
vci-scale-seti-api2	IN	A	172.28.45.42
vci-scale-seti-api3	IN	A	172.28.45.43
vci-scale-billing-db-blue     IN  A   172.28.46.1
vci-scale-misc-db-blue     IN  A   172.28.46.2
vci-scale-lvs1     IN  A   172.28.47.1
vci-scale-lvs2     IN  A   172.28.47.2

;DVOP-997
vci-scale-db-green IN  A   172.28.101.19
vci-scale-db-blue  IN  A   172.28.101.20
vci-scale-db-green-oob IN A 172.24.5.21
;vci-dev1        IN  A   172.26.100.30
;vci-dev2        IN  A   172.26.100.31
;vci-dev3        IN  A   172.26.100.32
vci-dev-services        IN  A   172.26.100.31
vci-dev-core        IN  A   172.26.100.32
vci-dev-docker	IN	A	172.26.100.33
vci-mobile-dev-docker	IN	A	172.26.100.34
vci-mobile-stable-docker	IN	A	172.26.100.36
vci-lm-logstash1        IN  A   172.26.108.1
vci-lm-graphite1        IN  A   172.26.108.100
verizon-sms-dev     IN  A   172.26.112.1
;vci-dev-core        IN  CNAME   vci-dev3
;vci-dev-services        IN  CNAME  vci-dev2
vci-dev-lmw     IN  A   172.26.100.40
vci-stable-docker     IN  A   172.26.130.2
vci-stable-core     IN  A   172.26.130.4
vci-stable-services     IN  A   172.26.130.5
vci-stable-recon1       IN  A   172.26.135.1
vci-scale-incoming-event-queue      IN  A   172.26.107.254
vci-scale-incoming-event-queue1     IN  A   172.26.107.1
vci-scale-incoming-event-queue2     IN  A   172.26.107.2
vci-scale-incoming-event-queue3     IN  A   172.26.107.3
vci-scale-incoming-event-queue4     IN  A   172.26.107.4
vci-scale-seti-task1    IN  A   172.26.107.1
vci-scale-seti-task2    IN  A   172.26.107.2
lvs-dmz1-old        IN  A   172.26.5.1
lvs-dmz2        IN  A   172.26.5.2
; this is the new lvs-dmz1
lvs-dmz1        IN  A   172.26.5.10
vci-cte-lvs1    IN A 172.26.124.1
vci-cte-lvs2    IN A 172.26.124.2
kiln-cte        IN  A   172.26.106.254
kiln-cte1       IN  A   172.26.106.1
kiln-cte2       IN  A   172.26.106.2
kiln-cte3       IN  A   172.26.106.3
notify-dev      IN  A   172.26.106.101
notify-stable1      IN  A   172.26.178.1
notify-stable2      IN  A   172.26.178.2
notify-stable-lp1   IN  A   172.26.179.1
notify-stable-lp2   IN  A   172.26.179.2
notify-stable-lp    IN  A   172.26.179.254
cte-mockkiln1       IN  A   172.26.106.20
cte-mockkiln2       IN  A   172.26.106.21
kiln-cte-rabbit     IN  A   172.26.106.254
kiln-cte-services       IN  A   172.28.106.1
test-fai-dmz        IN  A   172.24.0.22
tlf-android-dev     IN  A   66.211.104.174
;; vci-automation boxes were moved to engr as per ITSS-2771
; vci-automation-lucid  IN  A   172.28.101.253
; vci-automation-precise    IN  A   172.28.101.254
vci-scale-core-api-ec2      IN  A   66.211.104.182
vci-scale-core-api      IN  A   172.26.104.254
vci-scale-core-api1     IN  A   172.26.104.1
vci-scale-core-api2     IN  A   172.26.104.2
vci-scale-core-api3     IN  A   172.26.104.3
vci-scale-core-api4     IN  A   172.26.104.4
vci-scale-core-api5     IN  A   172.26.104.5
vci-scale-core-api6     IN  A   172.26.104.6
vci-scale-core-api7     IN  A   172.26.104.7
vci-scale-core-api8     IN  A   172.26.104.8
vci-scale-core-api9     IN  A   172.26.104.9
vci-scale-core-api10        IN  A   172.26.104.10
vci-scale-core-api11        IN  A   172.26.104.11
vci-scale-core-api12        IN  A   172.26.104.12
vci-scale-core-event1       IN  A   172.26.105.1
vci-scale-core-event2       IN  A   172.26.105.2
vci-scale-core-event3       IN  A   172.26.105.3
vci-scale-core-event4       IN  A   172.26.105.4
vci-scale-core-event5       IN  A   172.26.105.5
vci-scale-core-event6       IN  A   172.26.105.6
vci-scale-core-event7       IN  A   172.26.105.7
vci-scale-core-event8       IN  A   172.26.105.8
vci-scale-core-event9       IN  A   172.26.105.9
vci-scale-core-event10      IN  A   172.26.105.10
vci-scale-core-event11      IN  A   172.26.105.11
vci-scale-core-event12      IN  A   172.26.105.12

vci-scale-core1     IN  A   172.26.102.1
vci-scale-core2     IN  A   172.26.102.2
vci-scale-core3     IN  A   172.26.102.3
vci-scale-hs-api1       IN  A   172.28.101.11
vci-scale-hs-api2       IN  A   172.28.101.12
vci-scale-hs-api3       IN  A   172.28.101.13
vci-scale-hs-api4       IN  A   172.28.101.14
vci-scale-hs-api5       IN  A   172.28.101.15
vci-scale-hs-api6       IN  A   172.28.101.16
vci-scale-hs-api7       IN  A   172.28.101.17
vci-scale-hs-api8       IN  A   172.28.101.18
vci-scale-hs1       IN  A   172.26.101.1
vci-scale-hs2       IN  A   172.26.101.2
vci-scale-hs3       IN  A   172.26.101.3
vci-scale-incoming-event-queue1     IN  A   172.26.107.1
vci-scale-incoming-event-queue2     IN  A   172.26.107.2
vci-scale-incoming-event-queue3     IN  A   172.26.107.3
vci-scale-incoming-event-queue4     IN  A   172.26.107.4
vci-scale-int1      IN  A   172.26.103.1
vci-scale-int2      IN  A   172.26.103.2
vci-scale-int3      IN  A   172.26.103.3
vci-scale-mock1     IN  A   172.28.101.100
vci-mobile-dev-core     IN  A   172.26.110.1
vci-mobile-dev-services     IN  A   172.26.110.2
vci-mobile-stable-core      IN  A   172.26.110.3
vci-mobile-stable-services      IN  A   172.26.110.4
vci-scale-core-scheduler1   IN A 172.26.120.1
vci-scale-core-scheduler2   IN A 172.26.120.2
vci-scale-core-task1    IN A 172.26.121.1
vci-scale-core-task2    IN A 172.26.121.2
;;IG-603
vci-scale-riak1    IN A 172.26.121.11
vci-scale-riak2    IN A 172.26.121.12
vci-scale-riak3    IN A 172.26.121.13
vci-scale-riak4    IN A 172.26.121.14
vci-scale-riak5    IN A 172.26.121.15

;
;scale3 env
;

vci-scale3-core-api IN  A   172.26.133.254
vci-scale3-core-api1    IN  A   172.26.133.41
vci-scale3-core-api2    IN  A   172.26.133.42
vci-scale3-core-api3    IN  A   172.26.133.43
vci-scale3-core-api4    IN  A   172.26.133.44
vci-scale3-core-api5    IN  A   172.26.133.45
vci-scale3-core-api6    IN  A   172.26.133.46
vci-scale3-core-api7    IN  A   172.26.133.47
vci-scale3-core-api8    IN  A   172.26.133.48
vci-scale3-core-api9    IN  A   172.26.133.49
vci-scale3-core-api10    IN  A   172.26.133.50
vci-scale3-core-api11    IN  A   172.26.133.51
vci-scale3-core-api12    IN  A   172.26.133.52
vci-scale3-core-event1  IN  A   172.26.133.61
vci-scale3-core-event2  IN  A   172.26.133.62
vci-scale3-core-event3  IN  A   172.26.133.63
vci-scale3-core-event4  IN  A   172.26.133.64
vci-scale3-core-event5  IN  A   172.26.133.65
vci-scale3-core-event6  IN  A   172.26.133.66
vci-scale3-core-event7  IN  A   172.26.133.67
vci-scale3-core-event8  IN  A   172.26.133.68
vci-scale3-core-event9  IN  A   172.26.133.69
vci-scale3-core-recon1  IN  A   172.26.133.71
vci-scale3-core-task1   IN  A   172.26.133.81
vci-scale3-core-task2   IN  A   172.26.133.82
vci-scale3-scheduler1   IN  A   172.26.133.91
vci-scale3-scheduler2   IN  A   172.26.133.92
vci-scale3-scheduler3   IN  A   172.26.133.93
vci-scale3-redis-lock1  IN  A   172.26.133.101
vci-scale3-redis-lock2  IN  A   172.26.133.102
vci-scale3-redis-lock3  IN  A   172.26.133.103
vci-scale3-redis-cache1 IN  A   172.26.133.111
vci-scale3-redis-cache2 IN  A   172.26.133.112
vci-scale3-redis-cache3 IN  A   172.26.133.113
vci-scale3-incoming-event-queue IN  A   172.26.133.120
vci-scale3-incoming-eq1 IN  A   172.26.133.121
vci-scale3-incoming-eq2 IN  A   172.26.133.122
vci-scale3-incoming-eq3 IN  A   172.26.133.123
vci-scale3-hs-query IN  A   172.26.133.130
vci-scale3-hs-write IN  A   172.26.133.139
vci-scale3-history-api1 IN  A   172.26.133.131
vci-scale3-history-api2 IN  A   172.26.133.132
vci-scale3-history-api3 IN  A   172.26.133.133
vci-scale3-history-api4 IN  A   172.26.133.134
vci-scale3-history-api5 IN  A   172.26.133.135
vci-scale3-history-api6 IN  A   172.26.133.136
vci-scale3-history-api7 IN  A   172.26.133.137
vci-scale3-history-api8 IN  A   172.26.133.138
;; these last 4 are unfortunate
vci-scale3-history-api9 IN  A   172.26.133.143
vci-scale3-history-api10 IN  A   172.26.133.144
vci-scale3-history-api11 IN  A   172.26.133.145
vci-scale3-history-api12 IN  A   172.26.133.146
vci-scale3-seti IN  A   172.26.133.253
vci-scale3-seti1    IN  A   172.26.133.140
vci-scale3-seti2    IN  A   172.26.133.141
vci-scale3-seti3    IN  A   172.26.133.142
;; No more 26 block
vci-scale3-seti4    IN  A   172.28.138.1
vci-scale3-seti5    IN  A   172.28.138.2
 
;; IG-856
vci-scale3-aggregator-service1 IN A 172.26.133.147
vci-scale3-aggregator-service2 IN A 172.26.133.148
vci-scale3-aggregator-service3 IN A 172.26.133.149
vci-scale3-aggregator-service IN A 172.26.133.150

; 
; scale2 env
; 
vci-scale2-core-api IN  A   172.28.110.254
vci-scale2-core-api1    IN  A   172.28.110.1
vci-scale2-core-api2    IN  A   172.28.110.2
vci-scale2-core-api3    IN  A   172.28.110.3
vci-scale2-core-api4    IN  A   172.28.110.4
vci-scale2-core-api5    IN  A   172.28.110.5
vci-scale2-core-api6    IN  A   172.28.110.6
vci-scale2-core-event1  IN  A   172.28.111.1
vci-scale2-core-event2  IN  A   172.28.111.2
vci-scale2-core-scheduler1  IN  A   172.28.112.1
vci-scale2-core-scheduler2  IN  A   172.28.112.2
vci-scale2-core-task1   IN  A   172.28.113.1
vci-scale2-core-task2   IN  A   172.28.113.2
vci-scale2-incoming-event-queue IN  A   172.28.114.254
vci-scale2-incoming-event-queue1    IN  A   172.28.114.1
vci-scale2-incoming-event-queue2    IN  A   172.28.114.2
vci-scale2-incoming-event-queue3    IN  A   172.28.114.3
vci-scale2-incoming-event-queue4    IN  A   172.28.114.4
vci-scale2-mock1    IN  A   172.28.115.1
vci-scale2-mock2    IN  A   172.28.115.2
vci-scale2-mock3    IN  A   172.28.115.3
vci-scale2-mock4    IN  A   172.28.115.4
vci-scale2-mock5    IN  A   172.28.115.5
vci-scale2-mock6    IN  A   172.28.115.6
vci-scale2-hs-query IN  A   172.28.116.254
vci-scale2-hs-write IN  A   172.28.116.253
vci-scale2-hs-api1  IN  A   172.28.116.1
vci-scale2-hs-api2  IN  A   172.28.116.2
vci-scale2-hs-api3  IN  A   172.28.116.3
vci-scale2-hs-api4  IN  A   172.28.116.4
; part of vci scale
linseed-integration-vm  IN  A   172.28.117.1


;
; Aci cte env
;

aci-cte-3pp-core1         IN      A       172.28.140.1
aci-cte-3pp-core2         IN      A       172.28.140.2
aci-cte-3pp-core3         IN      A       172.28.140.3
aci-cte-3pp-core          IN      A       172.28.140.10
aci-cte-3pp-qr1           IN      A       172.28.140.11
aci-cte-3pp-qr2           IN      A       172.28.140.12
aci-cte-3pp-qr3           IN      A       172.28.140.13
aci-cte-api-locator       IN      A       172.28.140.20
aci-cte-api-locator1      IN      A       172.28.140.21
aci-cte-api-locator2      IN      A       172.28.140.22
aci-cte-lvs1              IN      A       172.28.140.23
aci-cte-lvs2              IN      A       172.28.140.24
aci-cte-cdr-bookkeeper    IN      A       172.28.140.30
aci-cte-cdr-bookkeeper1   IN      A       172.28.140.31
aci-cte-cdr-bookkeeper2   IN      A       172.28.140.32
aci-cte-cdr-bookkeeper3   IN      A       172.28.140.33
aci-cte-cdr-cons-core1    IN      A       172.28.140.41
aci-cte-cdr-cons-core2    IN      A       172.28.140.42
aci-cte-cdr-cons-core3    IN      A       172.28.140.43
aci-cte-cdr-cons-core4    IN      A       172.28.140.44
aci-cte-cdr-cons-core5    IN      A       172.28.140.45
aci-cte-cdr-cons-core6    IN      A       172.28.140.46
aci-cte-cdr-cons-store    IN      A       172.28.140.50
aci-cte-cdr-cons-store1   IN      A       172.28.140.51
aci-cte-cdr-cons-store2   IN      A       172.28.140.52
aci-cte-cdr-cons-store3   IN      A       172.28.140.53
aci-cte-cdr-pub-api      IN      A       172.28.140.60
aci-cte-cdr-pub-api1     IN      A       172.28.140.61
aci-cte-cdr-pub-api2     IN      A       172.28.140.62
aci-cte-cdr-pub-api3     IN      A       172.28.140.63
aci-cte-cdr-pub-api4     IN      A       172.28.140.64
aci-cte-cdr-pub-api5     IN      A       172.28.140.65
aci-cte-cdr-pub-api6     IN      A       172.28.140.66
aci-cte-cdr-pub-qr1       IN      A       172.28.140.71
aci-cte-cdr-pub-qr2       IN      A       172.28.140.72
aci-cte-cdr-pub-qr3       IN      A       172.28.140.73
aci-cte-cdr-sched-cache   IN      A       172.28.140.80
aci-cte-cdr-sched-cache1  IN      A       172.28.140.81
aci-cte-cdr-sched-cache2  IN      A       172.28.140.82
aci-cte-cdr-sched-cache3  IN      A       172.28.140.83
aci-cte-cdr-sched-core1   IN      A       172.28.140.91
aci-cte-cdr-sched-core2   IN      A       172.28.140.92
aci-cte-cdr-sched-core3   IN      A       172.28.140.93
aci-cte-cdr-sched-qr      IN      A       172.28.140.100
aci-cte-cdr-sched-qr1     IN      A       172.28.140.101
aci-cte-cdr-sched-qr2     IN      A       172.28.140.102
aci-cte-cdr-sched-qr3     IN      A       172.28.140.103
aci-cte-seti-api       IN      A       172.28.140.110
aci-cte-seti-api1      IN      A       172.28.140.111
aci-cte-seti-api2      IN      A       172.28.140.112
aci-cte-seti-api3      IN      A       172.28.140.113
aci-cte-core-account      IN      A       172.28.140.120
aci-cte-core-account1     IN      A       172.28.140.121
aci-cte-core-account2     IN      A       172.28.140.122
aci-cte-core-account3     IN      A       172.28.140.123
aci-cte-core-api          IN      A       172.28.140.130
aci-cte-core-api1         IN      A       172.28.140.131
aci-cte-core-api2         IN      A       172.28.140.132
aci-cte-core-api3         IN      A       172.28.140.133
aci-cte-core-api4         IN      A       172.28.140.134
aci-cte-core-api5         IN      A       172.28.140.135
aci-cte-core-api6         IN      A       172.28.140.136
aci-cte-core-cache1       IN      A       172.28.140.146
aci-cte-core-cache2       IN      A       172.28.140.147
aci-cte-core-cache3       IN      A       172.28.140.148
aci-cte-core-event1       IN      A       172.28.140.151
aci-cte-core-event2       IN      A       172.28.140.152
aci-cte-core-event3       IN      A       172.28.140.153
aci-cte-core-event4       IN      A       172.28.140.154
aci-cte-core-event5       IN      A       172.28.140.155
aci-cte-core-event6       IN      A       172.28.140.156
aci-cte-incoming-eq1      IN      A       172.28.140.170
aci-cte-incoming-eq2      IN      A       172.28.140.171
aci-cte-incoming-eq3      IN      A       172.28.140.172
aci-cte-core-lock1        IN      A       172.28.140.181
aci-cte-core-lock2        IN      A       172.28.140.182
aci-cte-core-lock3        IN      A       172.28.140.183
aci-cte-core-scheduler    IN      A       172.28.140.190
aci-cte-core-scheduler1   IN      A       172.28.140.191
aci-cte-core-scheduler2   IN      A       172.28.140.192
aci-cte-core-scheduler3   IN      A       172.28.140.193
aci-cte-core-scheduler-q  IN      A       172.28.140.200
aci-cte-core-scheduler-q1 IN      A       172.28.140.201
aci-cte-core-scheduler-q2 IN      A       172.28.140.202
aci-cte-core-scheduler-q3 IN      A       172.28.140.203
aci-cte-core-task1        IN      A       172.28.140.211
aci-cte-core-task2        IN      A       172.28.140.212
aci-cte-core-task3        IN      A       172.28.140.213
aci-cte-cps-att-q1        IN      A       172.28.140.221
aci-cte-cps-att-q2        IN      A       172.28.140.222
aci-cte-cps-att-q3        IN      A       172.28.140.223
aci-cte-cps-cache1	  IN	  A	  172.28.140.235
aci-cte-cps-cache2	  IN	  A	  172.28.140.236
aci-cte-cps-cache3	  IN	  A	  172.28.140.237
aci-cte-docker            IN      A       172.28.140.119
aci-cte-ep-cache1         IN      A       172.28.140.231
aci-cte-ep-cache2         IN      A       172.28.140.232
aci-cte-ep-cache3         IN      A       172.28.140.233
aci-cte-history-store     IN      A       172.28.140.240
aci-cte-history-store1    IN      A       172.28.141.1
aci-cte-history-store2    IN      A       172.28.141.2
aci-cte-history-store3    IN      A       172.28.141.3
aci-cte-history-store4    IN      A       172.28.141.4
aci-cte-history-store5    IN      A       172.28.141.5
aci-cte-history-store6    IN      A       172.28.141.6
aci-cte-history-store7    IN      A       172.28.141.7
aci-cte-history-store8    IN      A       172.28.141.8
aci-cte-incoming-eq-api   IN      A       172.28.141.10
aci-cte-incoming-eq-api1  IN      A       172.28.141.11
aci-cte-incoming-eq-api2  IN      A       172.28.141.12
aci-cte-incoming-eq-api3  IN      A       172.28.141.13
aci-cte-mock              IN      A       172.28.141.20
aci-cte-notification-qr1  IN      A       172.28.141.21
aci-cte-notification-qr2  IN      A       172.28.141.22
aci-cte-notification-qr3  IN      A       172.28.141.23
aci-cte-requestacks-q1    IN      A       172.28.141.31
aci-cte-requestacks-q2    IN      A       172.28.141.32
aci-cte-requestacks-q3    IN      A       172.28.141.33
aci-cte-webapp            IN      A       172.28.141.40
aci-cte-webapp1           IN      A       172.28.141.41
aci-cte-webapp2           IN      A       172.28.141.42
aci-cte-webapp3           IN      A       172.28.141.43
aci-cte-ieq-mock          IN      A       172.28.141.50
aci-cte-ieq-mock1         IN      A       172.28.141.51
aci-cte-ieq-mock2         IN      A       172.28.141.52
aci-cte-ieq-mock3         IN      A       172.28.141.53
aci-cte-requestacks1         IN      A       172.28.141.61
aci-cte-requestacks2         IN      A       172.28.141.62
aci-cte-requestacks3         IN      A       172.28.141.63
aci-cte-hp-tguard-mock         IN      A       172.28.141.70
aci-cte-hp-tguard-mock1         IN      A       172.28.141.71
aci-cte-hp-tguard-mock2         IN      A       172.28.141.72
aci-cte-hp-tguard-mock3         IN      A       172.28.141.73
aci-cte-hp-emcsi-mock         IN      A       172.28.142.80
aci-cte-hp-emcsi-mock1         IN      A       172.28.142.81
aci-cte-hp-emcsi-mock2         IN      A       172.28.142.82
aci-cte-hp-emcsi-mock3         IN      A       172.28.142.83
aci-cte-hp-emcsi-store         IN      A       172.28.142.89
aci-cte-hp-csi-mock         IN      A       172.28.142.90
aci-cte-hp-csi-mock1         IN      A       172.28.142.91
aci-cte-hp-csi-mock2         IN      A       172.28.142.92
aci-cte-hp-csi-mock3         IN      A       172.28.142.93
aci-cte-test1         IN      A       172.28.142.110
aci-cte-test2         IN      A       172.28.142.111
aci-cte-test3         IN      A       172.28.142.112
aci-cte-test4         IN      A       172.28.142.113
aci-cte-test5         IN      A       172.28.142.114
aci-cte-test6         IN      A       172.28.142.115
aci-cte-test7         IN      A       172.28.142.116
aci-cte-test8         IN      A       172.28.142.117
aci-cte-test8         IN      A       172.28.142.118
aci-cte-test9         IN      A       172.28.142.119
aci-cte-test10         IN      A       172.28.142.120
aci-cte-contact-task1     IN      A       172.28.142.130

;
;LL LNM TESTING
;
ll-lnm-redis    IN  A   172.28.171.1
ll-lnm-es   IN  A   172.28.171.11
ll-lnm-kibana   IN  A   172.28.171.21
ll-lnm-logworker    IN  A   172.28.171.31

;
; sfp scale
;
sassy-dev   IN  A   172.28.37.1
sassy-stable    IN  A   172.28.37.2
sfp-scale-locator-web   IN  A   172.28.130.254
sfp-scale-locator-web1  IN  A   172.28.130.1
sfp-scale-locator-web2  IN  A   172.28.130.2
sfp-scale-locator-web3  IN  A   172.28.130.3
sfp-scale-locator-web4  IN  A   172.28.130.4
sfp-scale-locator-web5  IN  A   172.28.130.5
sfp-scale-locator-web6  IN  A   172.28.130.6
sfp-scale-locator-web7  IN  A   172.28.130.7
sfp-scale-locator-web8  IN  A   172.28.130.8
sfp-scale-locator-core1 IN  A   172.28.131.1
sfp-scale-locator-core2 IN  A   172.28.131.2
sfp-scale-locator-int1  IN  A   172.28.132.1
sfp-scale-locator-int2  IN  A   172.28.132.2
sfp-scale-core1 IN  A   172.28.133.1
sfp-scale-core2 IN  A   172.28.133.2
sfp-scale-cni-web   IN  A   172.28.134.254
sfp-scale-cni-web1  IN  A   172.28.134.1
sfp-scale-cni-web2  IN  A   172.28.134.2
sfp-scale-cni-web3  IN  A   172.28.134.3
sfp-scale-cni-web4  IN  A   172.28.134.4
sfp-scale-cni-int   IN  A   172.28.135.254
sfp-scale-cni-int1  IN  A   172.28.135.1
sfp-scale-cni-int2  IN  A   172.28.135.2
sfp-scale-cni-int3  IN  A   172.28.135.3
sfp-scale-cni-int4  IN  A   172.28.135.4
sfp-perf1   IN  A   172.28.136.1
sfp-perf2   IN  A   172.28.136.2
sfp-monitor1    IN  A   172.28.137.1
sprint-locator-optimize IN  A   172.28.36.1
sprint-locator-external IN  A   172.26.210.1
sprint-locator-staging-web1 IN  A   172.26.211.1    
sprint-sms-dev  IN  A   172.26.212.1
messaging-gateway-dev   IN  A   172.26.212.1
sparkle-autodeploy      IN  A   172.28.17.1
sparkle-dev-admin   IN  A   172.28.137.10
sparkle-dev-admin-new   IN  CNAME   sparkle-dev-admin

sparkle-cte-db1     IN  A   172.28.10.1
sparkle-cte-admin1      IN  A   172.28.9.1
sparkle-cte-web1        IN  A   172.28.20.1
sparkle-cte-web2        IN  A   172.28.20.2
sparkle-cte-web3        IN  A   172.28.20.3
sparkle-cte-cache1      IN  A   172.28.30.1
sparkle-cte-cache2      IN  A   172.28.30.2
sparkle-cte-queue1      IN  A   172.28.40.1
sparkle-cte-queue2      IN  A   172.28.40.2
sparkle-elephant    IN  A   172.26.187.1
sparkle-dev-redis   IN  A   172.28.50.254
sparkle-dev-redis1  IN  A   172.28.50.1
sparkle-dev-redis2  IN  A   172.28.50.2
sparkle-dev-redis1-new	IN	A	172.28.50.3
sparkle-dev-redis2-new	IN	A	172.28.50.4
swan-dmz        IN  A   172.26.199.1
chef1       IN  A   66.211.104.150
ntp1        IN  CNAME   tick.pnap.net.
ntp2        IN  CNAME   tock.pnap.net.
ssd-db      IN  A   172.26.50.1
checkin-dev     IN  A   172.26.50.2
jessetest   IN  A   172.28.111.111
sparkle-dev IN  A   172.26.184.1
vizible     IN  A   172.28.60.1
elasticsearch-dev1  IN  A   172.28.61.1
logstash-dev1       IN  A   172.28.62.1
kibana-dev1         IN  A   172.28.63.1
;; ITSS-4540
log-central-dev1	IN	A	172.28.64.1

;
; Sprint dev environment (ITSS-4097)
;
sdf-dev-web IN  A   172.28.122.1

sfp-dev-web IN  A   172.28.123.1
sfp-dev-core IN  A   172.28.123.11
sfp-dev-mock IN  A   172.28.123.21
sfp-dev-db IN  A   172.28.123.31
sfp-dev-nagios	IN	A 172.28.123.32
smc-dev-web IN  A   172.28.124.1
smc-dev-int IN  A   172.28.124.11

sfl-dev-web IN  A   172.28.125.1
sfl-dev-core IN  A   172.28.125.11
sfl-dev-int IN  A   172.28.125.21


corpweb-ext     IN  A   172.28.151.1
vci-various1        IN  A   172.28.152.1
vci-various2        IN  A   172.28.152.2
vci-evdc-qa        IN  A   172.28.154.1
evdc-stats  IN  A   172.28.187.1
aci-mobile-stable-core  IN  A   172.28.153.5
aci-mobile-stable-services  IN  A   172.28.153.15
aci-stable-core     IN  A   172.28.153.1
aci-stable-services IN  A   172.28.153.10
aci-dev-core        IN  A   172.28.150.1
aci-dev-services        IN  A   172.28.150.10
aci-autodeploy-core IN  A   172.28.153.6
aci-autodeploy-services IN  A   172.28.153.16
aci-csi-lab IN  A   172.26.176.1
aci-3pp-lab IN  A   172.26.177.1

diary-web1  IN  A   172.26.158.1

hack-233    IN  A   172.28.179.2
it-test1    IN  A   172.28.179.3
it-test2    IN  A   172.28.179.4

kiln-deploy-1   IN  A   172.28.167.1
owncloud    IN  A   172.26.160.1
stageweb    IN  A   172.28.230.1    
;;andrew-vm1  IN  A   172.28.121.1
build-auto-deploy   IN  A   172.26.134.1
tsprint-tracking    IN  A   172.26.169.1
finder-deploy   IN  A   172.28.168.1
greeneggs-autotest  IN  A   172.28.156.1
ros-autotest  IN  A   172.28.156.100
vci-autodeploy-core IN  A   172.28.189.1
vci-autodeploy-services IN  A   172.28.189.2
vci-autodeploy-docker	IN	A	172.28.189.3
sparkle-autodeploy-test IN  A   172.28.188.1
latest-attfm-automated  IN  A   172.26.150.1
latest-sprint-automated  IN  A   172.26.150.3
rs-qa-automated  IN  A   172.26.150.2
greeneggs-stable	IN  A   172.26.217.1
greeneggs-dev	IN  A   172.26.218.1
sigur-stable1	IN  A   172.26.224.1

; machines below mostly in esxi32/33
indigo-dev1 IN  A   172.26.196.1
indigo-stable1 IN  A   172.26.196.2
indigo-stable2 IN  A   172.26.196.3
afm-alert-stable1 IN  A   172.26.196.4
afm-web-stable1	IN	A	172.26.159.1

; DVOP-1133 
afm-kiln-staging1	IN	A 172.26.159.30 	
afm-kiln-staging2	IN	A 172.26.159.31 	

;; IG-448
afm-staging-location-exp	IN	A	172.26.159.32

; DVOP-1038
afm-web-stable IN	CNAME afm-web-stable1	
;finder-api-dev.locationlabs.com 66.211.104.197
finder-api-dev IN  A   172.26.196.5
afm-web-staging IN  A   66.211.104.156
afm-web-staging1 IN  A   172.26.156.1
afm-web-staging2 IN  A   172.26.156.2
elephant-dev-db IN  A   172.26.196.8
elephant-dev-web1 IN  A   172.26.196.9
elephant-dev-web2 IN  A   172.26.196.10
; elephant-dev-web lvs entry 192.20 
;afm-rs-dev1.locationlabs.com 66.211.104.148
afm-rs-dev1 IN  A   172.26.196.11
;receipts-staging1.locationlabs.com 66.211.104.169
receipts-staging1 IN  A   172.26.196.12
receipts-db-staging1 IN  A   172.26.196.13
receipts-stable IN  A   172.26.192.1
afm-rs-db-dev1 IN  A   172.26.196.14
afm-int-staging1 IN  A   172.26.196.15
afm-int-staging2 IN  A   172.26.196.16
afm-db-staging1 IN  A   172.26.196.17
;; afm-stable-int1 66.211.104.200
;; afm-stable-int1 IN  A   172.26.196.18
;; afm-int-stable1 IN  A   172.26.196.18
afm-services-stable1-old IN  A   172.26.196.18
afm-db-stable1 IN  A   172.26.196.19
afm-stable-provision1 IN  A   172.26.196.101
afm-db-dev1 IN  A   172.26.196.102
afm-stable-retail-signup IN  A   172.26.196.50
afm-dev-retail-signup IN  A   172.26.196.51
elephant-dev-web IN  A   172.26.196.20
afm-core-dev1	IN	A	172.26.196.53
afm-alert-dev1	IN	A	172.26.196.54
afm-web-dev1 IN  A   172.26.196.21
afm-web-dev2 IN  A   172.26.196.29
; DVOP-1038
afm-web-dev	IN	CNAME	afm-web-dev1
afm-finder-event-staging1	IN	A	172.26.196.201
afm-breaker-staging1	IN	A	172.26.196.202
afm-breaker-redis-staging1	IN	A	172.26.196.203
afm-sparkle-provision-web-staging1	IN	A	172.26.196.204
afm-integration-client-staging1	IN	A	172.26.196.205
att-dev1	IN	CNAME	afm-web-dev1
afm-dev1 IN  A   172.26.196.30
cobbler-it IN  A   172.26.196.22
cobbler-it-test1 IN  A   172.26.196.23
cobbler-it2 IN  A   172.26.196.24
cobbler-it-test2 IN  A   172.26.196.25
it-cobbler1 IN  A   172.26.196.27
it-cobbler2 IN  A   172.26.196.28
sigur-staging1 IN  A   172.26.139.1
sigur-dev1 IN  A   172.26.194.1
sigur-dev2 IN  A   172.26.194.2
;;IG-234 rename inviteafm-dev to ros-dev1
ros-dev1 IN  A   172.28.149.1
ros-dev2 IN  A   172.28.149.2
inviteafm-stable IN  A   172.28.195.1
inviteafm-web1 IN  A   172.26.200.1
inviteafm-web2 IN  A   172.26.200.2
test-vm1	IN	A	172.24.2.1
test-vm2	IN	A	172.24.2.2
test-vm3	IN	A	172.24.2.3
finder-api-stable	IN	A	172.26.189.1
finder-api-staging	IN	A	172.26.137.1
dmz-vpn1	IN	A	172.26.174.1
usabulksms-stable IN  A   172.28.154.1
ros-staging1 IN  A   172.26.230.1
;; This may no longer exist? beagle-dev	IN	A	172.26.141.1
;; tilden 
tilden-beta-api1	IN	A	172.26.141.1
tilden-beta-lm	IN	A	172.26.141.2
tilden-beta-graphite	IN	A	172.26.141.4
tilden-beta-kibana	IN	A	172.26.141.5
tilden-beta-service1	IN	A	172.26.141.3
tilden-beta-service2	IN	A	172.26.141.6
tilden-beta-db	IN	CNAME	tilden-beta-db-green.evdc.wavemarket.com.
tilden-beta-db-green	IN	A	172.28.147.1
; tilden-beta-services	IN	CNAME	tilden-beta-service1.evdc.wavemarket.com.
tilden-beta-kafka1	IN	A	172.26.141.10
tilden-beta-kafka2	IN	A	172.26.141.11
tilden-beta-kafka3	IN	A	172.26.141.12
tilden-beta-zk1	IN	A	172.26.141.20
tilden-beta-zk2	IN	A	172.26.141.21
tilden-beta-zk3	IN	A	172.26.141.22
tilden-beta-consul1 IN	A	172.26.141.23
tilden-beta-consul2 IN	A	172.26.141.24
tilden-beta-consul3 IN	A	172.26.141.25
tilden-dev-api1 IN      A       172.26.238.1
tilden-dev-service1     IN      A       172.26.238.2
tilden-dev-services	IN	CNAME	tilden-dev-service1.evdc.wavemarket.com.
tilden-dev-db   IN      A       172.26.238.3
tilden-dev-lm   IN      A       172.26.238.4
tilden-dev-graphite    IN      A       172.26.238.6
tilden-dev-kibana      IN      A       172.26.238.7
tilden-dev-kafka        IN      A       172.26.238.5
tilden-dev-consul	IN	A	172.26.238.8
tilden-load-test	IN	A	172.26.239.1
monkeybarrel	IN	A	172.26.239.2
hackday-vmdd1	IN	A	172.26.155.1
hackday-vmdd2	IN	A	172.26.155.2
hackday-486	IN	A	172.26.192.1
sflhack	IN	A	172.26.202.1
hack-lvs1	IN	A	172.26.203.2
hack-lvs2	IN	A	172.26.203.3
hack-backend1	IN	A	172.26.203.10
hack-backend2	IN	A	172.26.203.11
hack-backend	IN	A	172.26.203.20
hd-lvs1	IN	A	172.26.203.21
hd-lvs1	IN	A	172.26.203.22
vitaviola-web	IN	A	172.28.205.1
sfl-mobile-web-staging   IN  A   172.26.226.1
att-provision-staging   IN  A   172.26.215.1
dmz-monitor1   IN  A   172.24.1.101
dmz-monitor2	IN	A	172.24.1.102
sre-elk-staging	IN	A	172.24.1.103
bundle-sdfu-staging-landing1   IN  A   172.26.203.1
sdfu-landing-dev   IN  A   172.26.159.2
;; 2015-03-03 Romain: fisheye-sandbox's ip now in the range that can talk to HQ
;; fisheye-sandbox   IN  A   172.28.108.1
fisheye-test   IN  A   172.28.108.2
;fisheye   IN  A   172.28.108.3
fisheye   IN  A   10.39.4.101
sfl-staging-int1	IN	A	172.28.129.1
sfl-staging-int2	IN	A	172.28.129.2
sfl-staging-int		IN	A	172.28.0.129
afm-quartz-db-staging1	IN	A	172.28.25.1
aci-feature-core	IN	A	172.28.212.1
aci-feature-services	IN	A	172.28.212.2
tilden-afm-dev1		IN	A	172.26.142.1	
tilden-afm-stable	IN	A	172.26.143.254
tilden-afm-stable1	IN	A	172.26.143.1
tilden-afm-stable2	IN	A	172.26.143.2
;; stable vms for sequoia datawarehouse/metrics reporting (ITSS-4977)
tilden-afm-data-stable1	IN	A	172.26.143.40
tilden-afm-data-stable2	IN	A	172.26.143.41
tilden-logs-afm-dev1	IN	A	172.26.143.42

; openstack
os-controller1	IN	A	172.28.199.1
os-network1	IN	A	172.28.199.11
;; sprint stable
sdf-stable-web	IN	A	172.28.164.1
sfl-stable-web  IN      A       172.28.164.2
sfp-stable-web  IN      A       172.28.164.3
smc-stable-web  IN      A       172.28.164.4
sfl-stable-core  IN      A       172.28.164.5
sfp-stable-core  IN      A       172.28.164.6
sfl-stable-int  IN      A       172.28.164.7
smc-stable-int  IN      A       172.28.164.8
sfp-stable-mock  IN      A       172.28.164.9
sfp-stable-db  IN      A       172.28.164.20

;; sprint staging env ITSS-4285
sfp-staging-core	IN	A	172.28.165.254
sfp-staging-core1	IN	A	172.28.165.1
sfp-staging-core2	IN	A	172.28.165.2
sfp-staging-notify	IN	A	172.28.165.10
sfp-staging-notify1	IN	A	172.28.165.11
sfp-staging-notify2	IN	A	172.28.165.12
sci-staging-int 	IN	A	172.28.165.20
sci-staging-int1	IN	A	172.28.165.21
sci-staging-int2	IN	A	172.28.165.22

;; IG-381
sfp-staging-location-exp	IN	A	172.28.165.50	
;; sprint DVOP-442 sfp-staging-nagios
sfp-staging-nagios	IN	A	172.28.165.23

;; sprint DVOP-441 sfp-stable-nagios	
sfp-stable-nagios	IN	A	172.28.164.21	

;; SFL-14922, redo staging
; sdf-staging-int 	IN	A	172.28.165.30
; sdf-staging-int1	IN	A	172.28.165.31
; sdf-staging-int2	IN	A	172.28.165.32

sfp-staging-ros1	IN	A	172.28.165.32
sfp-staging-locator-int 	IN	A	172.28.165.40
sfp-staging-locator-int1	IN	A	172.28.165.41
sfp-staging-locator-int2	IN	A	172.28.165.42
sfl-staging-mute	IN	A	172.28.165.80

;; SFL-14922, redo staging
; sfl-staging-mute1	IN	A	172.28.165.81
; sfl-staging-mute2	IN	A	172.28.165.82
tilden-sfp-staging-all2	IN	A	172.28.165.81
tilden-sfp-stable1	IN	A	172.28.165.82
tilden-sfp-stable2	IN	A	172.28.165.83

sfp-staging-locator-mute	IN	A	172.28.165.90
sfp-staging-locator-mute1	IN	A	172.28.165.91
sfp-staging-locator-mute2	IN	A	172.28.165.92
sfl-staging-db1	IN	A	172.28.165.61
tilden-sfp-staging-logs1 IN	A	172.28.165.110
tilden-sfp-staging-logs2 IN	A	172.28.165.111
sfl-staging-sherlock1	 IN	A	172.28.165.112
sfl-staging-sherlock2	 IN	A	172.28.165.113

;; SFL-14922, redo staging
sfp-staging-db1	IN	A	172.28.165.63
sfp-staging-locator-admin1	IN	A	172.28.165.62

sprint-staging-incoming-sms1	IN	A	172.26.138.1
sprint-staging-incoming-sms2	IN	A	172.26.138.2
sgb-staging-web1	IN	A	172.26.145.1
sgb-staging-web2	IN	A	172.26.145.2
sfp-staging-sms-listener1	IN	A	172.26.170.1
sfp-staging-sms-listener2	IN	A	172.26.170.2
sfp-staging-retail-web1	IN	A	172.26.177.1
sfp-staging-retail-web2	IN	A	172.26.177.2
sfl-staging-web1	IN	A	172.26.181.1
sfl-staging-web2	IN	A	172.26.181.2
sfp-staging-locator-web1	IN	A	172.26.185.1
sfp-staging-locator-web2	IN	A	172.26.185.2
sfp-staging-locator-wap1	IN	A	172.26.186.1
sfp-staging-locator-wap2	IN	A	172.26.186.2
sfp-staging-locator-core1	IN	A	172.26.187.1
sfp-staging-locator-core2	IN	A	172.26.187.2
sfl-staging-api-shim1	IN	A	172.26.208.1
sfl-staging-api-shim2	IN	A	172.26.208.2
sci-staging-web1	IN	A	172.26.209.1
sci-staging-web2	IN	A	172.26.209.2

;; SFL-14922, redo staging
; sdf-staging-web1	IN	A	172.26.213.1
; sdf-staging-web2	IN	A	172.26.213.2
sfp-staging-sigur1	IN	A	172.26.213.1
tilden-sfp-staging-all1	IN	A	172.26.213.2

;; SFL-14922, redo staging
; sfl-staging-wap1	IN	A	172.26.214.1
; sfl-staging-wap2	IN	A	172.26.214.2
sfl-staging-tilden1	IN	A	172.26.214.1
sfl-staging-tilden2	IN	A	172.26.214.2

sprint-staging-lvs1	IN	A	172.26.216.1
sprint-staging-lvs2	IN	A	172.26.216.2

evdc-nagios	IN	A	172.26.16.1

;; ITSS-4314 (sigur/ros).  Allocating 172.28.10/24 for this, reserving lower ips in subnet for
;; infrastructure stuff.
sfp-dev-sigur    IN A 172.28.10.20
sfp-stable-sigur IN A 172.28.10.21
sfp-dev-ros      IN A 172.28.10.22
sfp-stable-ros   IN A 172.28.10.23

;; interview vm needs to be publically available
interview	IN	A	172.25.116.1

;; new hd-sonar to replace the one in the office
hd-sonar	IN	A	172.25.117.1	

;; sfl staging
sfl-staging-api-shim    IN      A       66.211.104.208
sgp-staging-web         IN      A       66.211.104.145
sci-staging-web         IN      A       66.211.104.209
sdf-staging-web IN      A       66.211.104.213
sfp-staging-locator-web IN      A       66.211.104.185
sfp-staging-locator-wap IN      A       66.211.104.186
sfp-staging-locator-core        IN      A       66.211.104.187
sprint-staging-incoming-sms     IN      A       66.211.104.138
;sfl-staging-web        IN      A       66.211.104.181
sfl-staging-wap IN      A       66.211.104.214
sfp-staging-sms-listener        IN      A       66.211.104.170
sfp-staging-retail-web          IN      A       66.211.104.177

;; ITSS-4228
bower             IN      A       172.28.10.30

;; ITSS-4224
booklog-ember     IN      A       172.28.10.40

;; ITSS-4463
mapserver-staging IN      A       172.28.10.50

;; ITSS-4010
metrics-staging-relay           IN      A       172.28.10.60
metrics-staging-graphite        IN      A       172.28.10.70

;; cic-dev1 for ITSS-4609
;; Moved the VM from esxi-dmz27 to hv-dmz7 for ITSS-5066
cic-dev1	IN	A	172.28.177.1

;;; HACKDAY 8/7-8/2014
;; ITSS-4521 
;;;hubris          IN      A       172.28.10.80 REMOVED AND RECREATED IN HQ
;; ITSS-4523
fancypants1	IN	A	172.28.10.81
fancypants2	IN	A	172.28.10.82
fancypants3	IN	A	172.28.10.83
fancypants4	IN	A	172.28.10.84
fancypants5	IN	A	172.28.10.85
;;; END HACKDAY 8/7-8/2014

;; docker-images for ITSS-4636
docker-images	IN	A	172.28.178.1
docker-images-staging	IN	A	172.28.172.10

;; sfl-dev and sfl-stable for ITSS-4689, ITSS-4690, ITSS-4691, ITSS-4692
tilden-sfl-dev-all	IN	A	172.28.191.1
sfl-dev-tux		IN	A	172.28.191.2
tilden-sfl-stable-all	IN	A	172.28.191.3
sfl-stable-tux		IN	A	172.28.191.4

;; data-warehouse boxes for ITSS-4710 and ITSS-4027
vzw-db-metrics-dev	IN	A	172.28.193.1
datawarehouse-dev	IN	A	172.28.193.2
vzw-db-metrics-stable	IN	A	172.28.193.3
datawarehouse-stable	IN	A	172.28.193.4
datawarehouse-staging	IN	A	172.28.193.5

;; super small vm for testing zabbix notifications
irwin-testvm	IN	A	172.28.179.5

;; viaduct-dev for ITSS-4728
viaduct-dev	IN	A	172.26.11.1

;; DVOP-1903
tfw-viaduct-dev	IN	A	172.26.11.1
tfw-finder-dev		IN	A	172.26.11.2

;; viaduct-stable for DVOP-70
viaduct-stable	IN	A	172.26.11.3

;; vci-gateway-hack for ITSS-4829
vci-gateway-hack	IN	A	172.26.12.1

;; tilden-ti-stable for ITSS-4849
;; Deleted in ITSS-5158
;;tilden-ti-stable-all		IN	A	172.26.13.1
;; tilden-ti-stable for ITSS-5073
tilden-ti-stable-api1		IN	A	172.26.13.2
tilden-ti-stable-service1	IN	A	172.28.13.1
tilden-ti-stable-db		IN	A	172.28.13.10
tilden-ti-stable-kafka		IN	A	172.28.13.11
tilden-ti-stable-lm		IN	A	172.28.13.12

;; lps machines for ITSS-4925
afm-lps-network-dev1	IN	A	172.26.143.20
afm-lps-network-stable1	IN	A	172.26.143.21
afm-lps-network-dev2	IN	A	172.26.143.22

;; stable vm for AFM data warehouse/metrics reporting for ITSS-4984
afm-data1-stable	IN	A	172.28.193.20

;; task box for AFM staging env for ITSS-4969
afm-task-staging1	IN	A	172.26.196.70

;; AFM tilden boxes required for the Staging env for ITSS-5005
afm-consul-staging1			IN	A	172.26.196.90
afm-consul-staging2			IN	A	172.26.196.91
afm-consul-staging3			IN	A	172.26.196.92
afm-kafka-staging1			IN      A       172.26.196.93
afm-kafka-staging2			IN      A       172.26.196.94
afm-kafka-staging3			IN      A       172.26.196.95
afm-location-api-staging1		IN	A	172.26.196.96
afm-location-api-staging2		IN	A	172.26.196.97
afm-location-data-staging		IN      A       172.26.196.98
afm-location-logging-staging		IN      A       172.26.196.99
afm-location-metrics-staging		IN      A       172.26.196.100
afm-location-monitoring-staging         IN      A       172.26.196.103
afm-location-mysql-staging-blue         IN      A       172.26.196.104
afm-location-mysql-staging-green        IN      A       172.26.196.105
afm-location-redis-staging1             IN      A       172.26.196.106
afm-location-redis-staging2             IN      A       172.26.196.107
afm-location-services-staging1          IN      A       172.26.196.108
afm-location-services-staging2          IN      A       172.26.196.109
afm-zookeeper-staging1                  IN      A       172.26.196.110
afm-zookeeper-staging2                  IN      A       172.26.196.111
afm-zookeeper-staging3                  IN      A       172.26.196.112
;; More boxes for AFM tilden for ITSS-5022
afm-lps-network-staging1		IN	A	172.26.196.113
afm-lps-network-staging2		IN	A	172.26.196.114
afm-location-es-data-staging1	IN	A	172.26.196.115
afm-location-es-data-staging2	IN	A	172.26.196.116
;; AFM DVOP-499, DVOP-500
afm-alert-staging1	IN	A	172.26.196.117

;; VMs in the cte environment for the recon process for ITSS-5042
aci-cte-core-billing-recon	IN	A	172.28.141.80
aci-cte-core-prov-recon		IN	A	172.28.141.90

;; ITSS-4724
vci-ext-stable-gateway1	IN	A	172.28.194.1
vci-ext-stable-gateway2	IN	A	172.28.194.2

;; ITSS-5059
babbage-stable	IN	A	172.28.196.1

;; VM in ACI cte environment for version arbiter service for ITSS-5077
aci-cte-versioning1	IN	A	172.28.141.100

;; VMs for the (old) AFM staging deployment for ITSS-5113
afm-finder-task-staging1	IN	A	172.26.196.120
afm-supporttool-staging1	IN	A	172.26.196.121
afm-threepp-event-staging1	IN	A	172.26.196.122
afm-qpass-event-staging1	IN	A	172.26.196.123
afm-olam-event-staging1		IN	A	172.26.196.124
afm-mobile-web-staging1		IN	A	172.26.196.125
afm-alert-system-staging1	IN	A	172.26.196.126

;; TMO stable env for ITSS-4762
tmo-stable-lvs1		IN	A	172.28.213.1
tmo-stable-lvs2		IN	A	172.28.213.2
tmo-stable-lvs-int1	IN	A	172.28.213.20
tmo-stable-db1		IN	A	172.28.213.3
tmo-stable-db2		IN	A	172.28.213.4
tmo-stable-recon1	IN	A	172.28.213.5
tmo-stable-alertsystem1	IN	A	172.28.213.6
tmo-stable-alertsystem2	IN	A	172.28.213.7
tmo-stable-lps1		IN	A	172.28.213.8
tmo-stable-lps2		IN	A	172.28.213.9
tmo-stable-core-web1	IN	A	172.28.213.10
tmo-stable-core-web2	IN	A	172.28.213.11
tmo-stable-core-api1	IN	A	172.28.213.12
tmo-stable-core-api2	IN	A	172.28.213.13
tmo-stable-sms1		IN	A	172.28.213.14
tmo-stable-sms2		IN	A	172.28.213.15
tmo-stable-redis1	IN	A	172.28.213.16
tmo-stable-redis2	IN	A	172.28.213.17
tmo-stable-operations	IN	A	172.28.213.18
tmo-stable-nagios	IN	A	172.28.213.19


;; Box in the sprint dev environment for new admin tool for ITSS-5126
sfp-dev-admin	IN	A	172.28.123.41

;; Box to host T-Mobile Finder for ITSS-5131
tfw-dev		IN	A	172.26.11.2
tfw-dev-alert-system	IN	A	172.26.11.4

;; Tilden-TI-Dev-* Environment for ITSS-5149
tilden-ti-dev-api1           IN      A       172.26.13.20
tilden-ti-dev-service1       IN      A       172.26.13.21
tilden-ti-dev-db             IN      A       172.28.13.20
tilden-ti-dev-kafka          IN      A       172.28.13.21
tilden-ti-dev-lm             IN      A       172.28.13.22

;; VM for deploying logstash in Sprint dev and stable environments for ITSS-5162
sfp-dev-logstash	IN	A	172.28.123.51

;; VM for a software escrow company for ITSS-5161
escrow	IN	A	172.28.214.1

;; A testbed for some analytics tools product management is trying, e.g. predictive data modeling using R, etc for ITSS-5180
charlie-dev	IN	A	172.28.215.1

;; VM for deploying Tilden applications in Sprint dev and stable environments for ITSS-5187
sfp-dev-tilden	IN	A	172.28.123.61

;; VMs for Sprint dev and stable environments to be used for running new dockerized metrics reporting components for SFL (ITSS-5190)
sfp-dev-metrics		IN	A	172.28.123.71
sfp-dev-data		IN	A	172.28.123.81
sfp-stable-metrics	IN	A	172.28.164.71
sfp-stable-data		IN	A	172.28.164.81

;; VM for deploying logstash in Sprint STABLE environment (ITSS-5207)
sfp-stable-logstash	IN	A	172.28.164.91

;; VM for ott dev environment (DVOP-1032)
ott-dev-all	IN	A	172.28.15.1

;; Openfire test (TOOL-1001)
openfire-test	IN	A	172.28.109.1

;; VM for data warehouse testing (DVOP-124)
datawarehouse-mock-dev	IN	A	172.28.14.111
datawarehouse-mock-stable	IN	A	172.28.14.112

;; vm for transaction log storage
storage1	IN	A	172.26.149.1

;; limsurvey vm
survey		IN	A	172.26.149.3

;; cloudseed
cloudseed	IN	A	172.26.150.4

;; mirage-dev
mirage-dev	IN	A	172.26.150.5

;; datawarehouse boxes
datawarehouse-services-dev	IN	A	172.26.161.1
datawarehouse-zookeeper-dev	IN	A	172.26.161.2
datawarehouse-kafka-dev	IN	A	172.26.161.3
datawarehouse-lm-dev	IN	A	172.26.161.4
datawarehouse-services-stable	IN	A	172.26.162.1
datawarehouse-zookeeper-stable	IN	A	172.26.162.2
datawarehouse-kafka-stable	IN	A	172.26.162.3
datawarehouse-lm-stable	IN	A	172.26.162.4

;;andrewt
andrew-vm1	IN	A	172.28.163.1

;; DVOP-693
viaduct-stable-es-data1	IN	A	172.28.162.1
viaduct-stable-es-data2	IN	A	172.28.162.2

;; service directory
svcdirectory	IN	A	172.28.192.2
svcdirectory-staging	IN	A	172.28.192.3

;; infra-metrics
infra-metrics1	IN	A	172.28.192.11

;; afm monitoring boxes
afm-monitor-dev1	IN	A	172.28.172.1
afm-monitor-stable1	IN	A	172.28.172.2
afm-monitor-staging1	IN	A	172.28.172.3

;; tci-dev
tci-dev-core	IN	A	172.28.172.4
tci-dev-services	IN	A	172.28.172.5

;; tci-mobile-stable
tci-mobile-stable-core	IN	A	172.28.172.6
tci-mobile-stable-services	IN	A	172.28.172.7

;; tci-stable
tci-stable-core	IN	A	172.28.172.8
tci-stable-services	IN	A	172.28.172.9

;; aci deployment server.... duh.
aci-deployment	IN	A	10.39.4.25


;; lob poc machines
poc-ucarp1	IN	A	172.27.131.11
poc-ucarp2	IN	A	172.27.131.12
poc-keepalived1	IN	A	172.27.131.21
poc-keepalived2	IN	A	172.27.131.22
poc-gslb1	IN	A	172.27.131.31
poc-gslb2	IN	A	172.27.131.32
poc-backend1	IN	A	172.27.131.41
poc-backend2	IN	A	172.27.131.42
poc-backend3	IN	A	172.27.131.43
poc-backend4	IN	A	172.27.131.44
poc-backend5	IN	A	172.27.131.45
poc-backend6	IN	A	172.27.131.46
poc-backend7	IN	A	172.27.131.47
poc-backend8	IN	A	172.27.131.48
poc-vip	IN	A	172.27.131.50
poc-vzwhaproxy1	IN	A	172.27.131.51
poc-test	IN	A	172.27.131.52
poc-lvs1	IN	A	172.27.131.61
poc-lvs2	IN	A	172.27.131.62

;; IG-117
build-java-docker1	IN	A	10.39.4.200

;; IG-174
build-nodejs-docker	IN	A	10.39.4.201

;; TOOL-1971
build-terraform-1	IN	A	10.39.4.13

;; lunchcation DVOP-957
lunchcation	IN	A	172.28.192.4
bobisuncle	IN	A	172.28.192.5

;; IG-293
ig-monitoring1	IN	A	172.28.139.1
ig-consul1	IN	A	172.28.139.2
ig-consul2	IN	A	172.28.139.3
ig-consul3	IN	A	172.28.139.4


;; tilden-sfp-stable DVOP-1025
;; tilden-sfp-stable	IN	A	66.211.104.201

;; DVOP-1141
ott-stable-all	IN	A	172.26.173.1

;; IG-379
tmo-stable-lps	IN	A	172.28.213.250

;; IG-320
afm-services-dev1	IN	A	172.26.172.1

;; IG-298
aci-cte-cdr-cache1	IN	A	172.28.143.1
aci-cte-cdr-cache2	IN	A	172.28.143.2
aci-cte-cdr-cache3	IN	A	172.28.143.3

infra-mon1	IN	A	172.28.139.11
infra-consul1	IN	A	172.28.139.12
infra-consul2	IN	A	172.28.139.13
infra-consul3	IN	A	172.28.139.14
infra-influxdb1	IN	A	172.28.139.15
infra-poller1	IN	A	172.28.139.16
infra-gateway1	IN	A	172.28.139.17
check-mk1	IN	A	172.28.139.18
infra-nagios2	IN	A	172.28.139.19
infra-autodeploy1	IN	A	172.28.139.20

;; IG-1094
ldap-staging1	IN	A	172.28.139.51
ldap-staging2	IN	A	172.28.139.52
radius-staging1	IN	A	172.28.139.53

;; IG-514
aci-dev-docker	IN	A	172.28.144.1
aci-stable-docker	IN	A	172.28.144.2
aci-mobile-stable-docker	IN	A	172.28.144.3
aci-autodeploy-docker	IN	A	172.28.144.4

;; IG-556
afm-services-stable1	IN	A	172.28.105.1
afm-web-stable2	IN	A	172.28.105.2
sigur-stable2	IN	A	172.28.105.3
ros-stable1	IN	A	172.28.105.4

;; IG-1160 
afm-alert-stable2	IN	A	172.28.105.5
afm-alert-system-staging2	IN	A	172.28.105.6
afm-alertsystem-dev2	IN	A	172.28.105.7

;; IG-1217
afm-location-api-staging-internal1	IN	A	172.28.105.8
afm-location-api-staging-internal2	IN	A	172.28.105.9
afm-location-api-staging-internal       IN      A       172.28.105.10

;; IG-704
ns1-common	IN	A	172.28.103.10
ns2-common      IN      A       172.28.103.11
ns1-evdc      IN      A       172.28.103.12
ns2-evdc      IN      A       172.28.103.13
ns1-elder      IN      A       172.28.103.14
ns2-elder      IN      A       172.28.103.15
ns1-aci      IN      A       172.28.103.16
ns2-aci      IN      A       172.28.103.17
ns1-afm      IN      A       172.28.103.18
ns2-afm      IN      A       172.28.103.19
ns1-sfp      IN      A       172.28.103.20
ns2-sfp      IN      A       172.28.103.21
ns1-tmw     IN      A       172.28.103.22
ns2-tmw      IN      A       172.28.103.23
ns1-pub      IN      A       172.28.103.24
ns2-pub      IN      A       172.28.103.25

;; IG-828
tfw-dev-alert-system2	IN	A	172.28.103.26

;; IG-886
aws-vpn1	IN	A	172.26.171.1
aws-vpn2	IN	A	172.26.171.2

;;IG-885
sfl-dev-alert	IN	A	172.28.103.27

;; IG-1245
aci-cte-cdr-cache	IN	A	172.28.143.254

;; IG-423
aci-cte-apns-gateway1	IN	A	172.28.173.1
aci-cte-apns-gateway2	IN	A	172.28.173.2
aci-cte-apns-gateway	IN	A	172.28.173.0

;; IG- 1486
pypi-sandbox	IN	A	172.28.5.200

;; IG-1657
tfw-dev-notify	IN	A	172.28.99.1

;; IG-1648
sfl-recon-new		IN	A	172.28.166.1
sfl-recon-db-new	IN	A	172.28.166.11
sfl-recon-old		IN	CNAME	sfl-recon-new 
sfl-recon-db-old	IN	CNAME 	sfl-recon-db-new
