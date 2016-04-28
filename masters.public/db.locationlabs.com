$TTL	1h

@	IN	SOA	ns3.wavemarket.com. root.wavemarket.com. (
		4161505201 ; this serial is unusual due to past efforts to fix serial number issues, just increment by one for now
			    5m        ; Refresh
			    3m        ; Retry
			    4w        ; Expire
			    1h        ; Negative Cache TTL
            )

;(don't list ns3 since it's a stealth server)
@	IN	NS	NS-A.PNAP.NET.
        IN	NS	NS-C.PNAP.NET.

;;; $INCLUDE /etc/bind/zones/mailrecords.include @

spf	IN	TXT	"v=spf1 ip4:66.211.104.128/25 ip4:66.211.110.0/24 ip4:66.211.99.48/29 ip4:69.25.109.0/24 ip4:66.171.207.0/24 ip4:66.171.204.48/29 ip4:66.150.250.162/29 ip4:184.72.218.68 ptr ip4:195.39.104.64/26 ip4:193.85.188.248/29 ip4:160.218.43.220 ip4:87.248.200.96/28" " ip4:212.96.161.224/27 ip4:93.184.217.0/27 ip4:93.184.211.16/28 ip4:10.232.176.0/27 ip4:204.193.144.0/25 ip4:193.85.156.215 ip4:193.85.156.216 ip4:108.161.241.41 ip4:108.161.241.42 ip4:72.159.170.225 ip4:72.159.170.226 include:spf1.locationlabs.com ?all"
spf1	IN	TXT	"v=spf1 ip4:195.39.5.12 ip4:195.39.5.13 ip4:109.105.55.7 ip4:109.105.55.9 ip4:155.56.221.13 ip4:155.56.221.14 ip4:209.87.235.15 ip4:208.115.214.0/24 ip4:74.63.202.0/24 ip4:75.126.200.128/27 ip4:75.126.253.0/24 ip4:67.228.50.32/27 ip4:174.36.80.208/28" " ip4:174.36.92.96/27 ip4:69.162.98.0/24 ip4:74.63.194.0/24 ip4:74.63.234.0/24 ip4:74.63.235.0/24 ip4:167.89.0.0/17 ip4:208.115.235.0/24 ip4:74.63.231.0/24 ip4:74.63.247.0/24 ip4:74.63.236.0/24 ip4:208.115.239.0/24 include:spf2.locationlabs.com ?all"
spf2	IN	TXT	"v=spf1 ip4:173.193.132.0/23 ip4:208.117.48.0/20 ip4:50.31.32.0/19 ip4:198.37.144.0/20 ip4:198.21.0.0/21 ip4:192.254.112.0/20 ip4:173.193.210.32/27 ip4:50.23.218.192/27 ip4:174.37.226.64/27 ip4:208.43.239.136/30 ip4:184.173.105.0/24 ip4:184.173.153.0/24" " ip4:104.130.122.0/23 ip4:209.61.151.0/24 ip4:166.78.68.0/22 ip4:198.61.254.0/23 ip4:192.237.158.0/23 ip4:23.253.182.0/24 ip4:23.253.183.0/24 ip4:104.130.96.0/28 ip4:85.158.136.0/21 ip4:193.109.254.0/23 include:spf3.locationlabs.com ?all"
spf3	IN	TXT	"v=spf1 ip4:194.106.220.0/23 ip4:195.245.230.0/23 ip4:95.131.104.0/21 ip4:46.226.48.0/21 ip4:196.14.170.0/23 ip4:216.82.240.0/20 ip4:67.219.240.0/20 ip4:117.120.16.0/21 ip4:103.9.96.0/22 ip4:62.25.80.152/29 ip4:62.208.159.152/29 ip4:66.59.91.0/24" " ip4:68.170.154.64/26 ip4:68.170.155.128/27 ip4:208.65.144.0/21 ip4:208.81.64.0/21 ip4:208.78.169.130 ip4:208.254.39.76 ptr:mxlogic.net ip4:205.227.136.216 ip4:67.97.80.206 ?all"


_domainkey      IN      TXT     "o=~; n=contact sa@wavemarket.com"
selector1._domainkey IN TXT "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+mHBMkpkihY2WoyyFqAQZ7TISsWzT7edXeO7wfjCcvB4siKhSx9E7cLw/oJ3oOr3898RCentfLmUPUkxRfHZb7FY3L06V/oubNtKAFd4mJzSvE0HtVTpSoo6x88xDMh5+dEr/FFTAEmdXzIMmmOfjvLpqAVRL2x+Aa4G5M5BF3QIDAQAB; DKIM=unknown; o=~"

_adsp._domainkey IN 	TXT "dkim=unknown"
_domainkey	 IN 	TXT "o=~; t=y"
default._domainkey IN	TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCuSFuhfiKf76NYeeRlv/l2g5PMBzIiOA5HxFRm3Q5II8lzG+8Vxwf0nk9iIJK8ufRoVzWBcAWOe2V39XKn45q1PGEfRptaynyPOKM3+EIcs1WanKT21leK5XNs4ZJlq85dk3z0LoMdvKQS7c1XLPjF982Caud+XJg2kEm6dhYZ4wIDAQAB"


; this is for greenhouse recruiting
k1._domainkey		IN	TXT "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmsDcCXJCqPoKBnDqEnQ1hMzg9l3NlLcKuU7XTaa9Z2m2Cott9umuQMgKZE/k2H58/ZItO/nj4jdIjyYIBKnc7BiLPvv8p94vEHU5awHfLoMYWvy6u6/Da7V/wN/Iea1pyz2Xs30v1FNshNePAj1xZrd3UZ1515OCjdpKHcsdq4QIDAQAB"

smtpapi._domainkey	IN	TXT	"k=rsa; t=s; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPtW5iwpXVPiH5FzJ7Nrl8USzuY9zqqzjE0D1r04xDN6qwziDnmgcFNNfMewVKN2D1O+2J9N14hRprzByFwfQW76yojh54Xu3uSbQ3JP0A7k8o8GutRF8zbFUA8n0ZH2y0cIEjMliXY4W4LwPA7m4q0ObmvSjhd63O9d8z1XkUBwIDAQAB"

smtpapi._domainkey.email	IN	TXT	"k=rsa; t=s; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPtW5iwpXVPiH5FzJ7Nrl8USzuY9zqqzjE0D1r04xDN6qwziDnmgcFNNfMewVKN2D1O+2J9N14hRprzByFwfQW76yojh54Xu3uSbQ3JP0A7k8o8GutRF8zbFUA8n0ZH2y0cIEjMliXY4W4LwPA7m4q0ObmvSjhd63O9d8z1XkUBwIDAQAB"

;ITSS-2824 amazon simple email service
_amazonses	IN      TXT 	"KxI41ZTFg+jUo4A05z59+djSKVeD0t9zgPIuIQNsuyw="
m4vup5e3lu4c4qfec2czdjql6rciekyu._domainkey	IN	CNAME	m4vup5e3lu4c4qfec2czdjql6rciekyu.dkim.amazonses.com.
l3h7xslz2xn75msi7pnfffh457exyvso._domainkey	IN	CNAME	l3h7xslz2xn75msi7pnfffh457exyvso.dkim.amazonses.com.
lwicew3ljb3gnd22dvrwdjkbuprqu5j5._domainkey	IN	CNAME	lwicew3ljb3gnd22dvrwdjkbuprqu5j5.dkim.amazonses.com.


@	IN	A 	66.211.104.153

; 3rd party stuff
o1.email	IN	A	 198.37.150.58
email		IN	CNAME	 sendgrid.net.

; corpweb external for agency access
corpweb-ext	IN	A	66.211.104.134

; iphone-callback
iphone-callback IN	A	69.25.109.153

; hq stuff
hq-edge-1	IN	A	66.211.104.246
hq-splunkfwd-1	IN	A       66.211.104.245
hq-splunkfwd-2  IN	A	66.211.104.244
help		IN	CNAME	locationlabs.zendesk.com.
;jabber		IN	CNAME	hq-openfire-1

; gurgaon stuff
invpn	IN	A	203.196.133.213

sparkle-indiadev	IN	A	203.196.133.221
; sparkle-dev-new	IN	A	66.211.104.184
sparkle-dev-redis	IN	CNAME	sparkle-dev-redis.evdc.wavemarket.com.
sparkle-intest		IN	A	203.196.133.203
sparkle-intest2		IN	A	203.196.133.205
sparkle-indev		IN	A	203.196.133.204
sparkle-reports-intest	IN	A	203.196.133.202

;; ITHD-4026
rat-dev		IN	A	203.196.133.206

sparkle-reports	IN	A	69.25.109.184
sparkle-cte	IN	A	66.211.104.219
sparkle-redis	IN	CNAME	sparkle-redis.sfdc.wavemarket.com.

; aci-lab
aci-tguard-lab	IN	A	69.25.109.38
aci-csr-lab	IN	A	69.25.109.171
aci-notify-lab	IN	A	69.25.109.41
aci-lab-core	IN	A	69.25.109.170
aci-lab-core1	IN	A	69.25.109.170
aci-lab-services	IN	A	69.25.109.171
aci-lab-services1	IN	A	69.25.109.171
aci-lab-redis	IN	CNAME	aci-lab-redis.sfdc.wavemarket.com
aci-sms-lab	IN	A	69.25.109.159

receipts-lab	IN	A	69.25.109.195
aci-appstore-core	IN	A	69.25.109.129
aci-appstore-services	IN	A	69.25.109.130

; aci-cte cnames
aci-cte-mock	IN	CNAME	aci-cte-mock.evdc.wavemarket.com.
aci-cte-3pp-core	IN	CNAME	aci-cte-3pp-core.evdc.wavemarket.com.
aci-cte-api-locator	IN	CNAME	aci-cte-api-locator.evdc.wavemarket.com.
aci-cte-cdr-bookkeeper	IN	CNAME	aci-cte-cdr-bookkeeper.evdc.wavemarket.com.
aci-cte-cdr-cons-store	IN	CNAME	aci-cte-cdr-cons-store.evdc.wavemarket.com.
aci-cte-cdr-pub-core	IN	CNAME	aci-cte-cdr-pub-core.evdc.wavemarket.com.
aci-cte-cdr-pub-api	IN	CNAME	aci-cte-cdr-pub-api.evdc.wavemarket.com.
aci-cte-cdr-sched-cache	IN	CNAME	aci-cte-cdr-sched-cache.evdc.wavemarket.com.
aci-cte-cdr-sched-qr	IN	CNAME	aci-cte-cdr-sched-qr.evdc.wavemarket.com.
aci-cte-cdr-scheduler-q	IN	CNAME	aci-cte-cdr-scheduler-q.evdc.wavemarket.com.
aci-cte-contact-api	IN	CNAME	aci-cte-contact-api.evdc.wavemarket.com.
aci-cte-seti-api	IN	CNAME	aci-cte-seti-api.evdc.wavemarket.com.
aci-cte-core-account	IN	CNAME	aci-cte-core-account.evdc.wavemarket.com.
aci-cte-core-api	IN	CNAME	aci-cte-core-api.evdc.wavemarket.com.
aci-cte-core-scheduler	IN	CNAME	aci-cte-core-scheduler.evdc.wavemarket.com.
aci-cte-history-store	IN	CNAME	aci-cte-history-store.evdc.wavemarket.com.
aci-cte-incoming-eq-api	IN	CNAME	aci-cte-incoming-eq-api.evdc.wavemarket.com.
aci-cte-webapp	IN	CNAME	aci-cte-webapp.evdc.wavemarket.com.
aci-cte-hp-emcsi-mock	IN	CNAME	aci-cte-hp-emcsi-mock.evdc.wavemarket.com.
aci-cte-hp-csi-mock	IN	CNAME	aci-cte-hp-csi-mock.evdc.wavemarket.com.

;aci-log
aci-prod-log-gateway	IN	CNAME	aci-prod-log-gateway.aci.sfdc.wavemarket.com.


;notify-staging env
notify-staging	IN	A	69.25.109.127
notify-staging-lp	IN	CNAME	notify-staging-lp.sfdc.wavemarket.com.

; vci-autodeploy-[services,core]
vci-autodeploy-services	IN	CNAME	vci-autodeploy-services.evdc.wavemarket.com.
vci-autodeploy-core	IN	CNAME	vci-autodeploy-core.evdc.wavemarket.com.

; everything
; elephant-cte	IN	A	66.211.104.164
; elephant-stable	IN	A	66.211.104.185
; elephant-dev	IN	A	66.211.104.186
; elephant-gateway	IN	A	69.25.109.203
; elephant	IN	A	69.25.109.238
;aci-autodeploy-services	IN	A	66.211.104.157
aci-autodeploy-services	IN	CNAME	aci-autodeploy-services.evdc.wavemarket.com.
aci-autodeploy-core	IN	CNAME	aci-autodeploy-core.evdc.wavemarket.com.
aci-dev-core	IN	A	66.211.104.178
aci-dev-services	IN	A	66.211.104.171
aci-staging-web	IN	A	69.25.109.136
aci-staging-int	IN	A	10.249.0.136
aci-stage-webapp	IN	A	66.171.207.236
aci-int		IN	A	10.249.0.137
aci-web		IN	A	69.25.109.137
aci-appdev	IN	A	69.25.109.138
aci-demo 	IN	A	69.25.109.139
aci-csi-lab	IN	A	66.211.104.176
; aci-3pp-lab	IN	A	66.211.104.177
aci-mobile-stable-core	IN	A	66.211.104.142
aci-mobile-stable-services	A	66.211.104.144
aci-stable-core	IN	A	66.211.104.179
aci-stable-services	IN	A	66.211.104.180
; att-checkin	IN	CNAME	checkin
att-checkin	IN	A	66.171.207.155
att-esl-demo	IN	A	66.211.104.188
att-sms-stable	IN	A	69.25.109.124

sprint-checkin	IN	A	69.25.109.183
sprint-locator-external	IN	A	66.211.104.210
sprint-locator-optimize	IN	A	66.211.104.131
; att-checkin-tmp	IN	A	69.25.109.187
att-integration	IN	CNAME	lps-sparkle-callback.locationlabs.com.
; afm-stable-retail-signup	IN	CNAME	afm-stable-retail-signup.locationlabs.com.

;; ITSS-4450
afm-dev-retail-signup           IN      A       66.211.110.197
afm-stable-retail-signup        IN      A       66.211.110.198

att-locator-staging-web		IN	A	69.25.109.157
att-locator-staging-int1	IN	CNAME	att-locator-staging-int1.sfdc.wavemarket.com.
att-locator-external		IN	A	69.25.109.89
att-locator-external-notify		IN	A	69.25.109.89
fw-web1		IN	A	69.25.109.179

; DVOP-1056
afm-threepp-event-staging1	IN	A	66.211.104.204

; DVOP-1037
ott-dev-all	IN	A	66.211.110.40

;adserver		IN	A	69.25.109.179
adserver-test	IN	A	69.25.109.127
attwp7	IN	CNAME	attwp7.wavemarket.com.
afmwp7demo	IN	CNAME	afmwp7demo.wavemarket.com.
;atest-globic	IN	A	66.211.104.215
; This is David N, removed autodiscover as part of decom exchange
;auto		IN	CNAME   autodiscover.locationlabs.com.
;autodiscover	IN  cname	autodiscoverredirect.collaborationhost.net.
;autodiscover	IN  	A	66.211.104.247
;www	IN	A 	 66.211.104.166
www	IN	A 	 66.211.104.153
mail	IN	A 	 66.211.104.168
meego	IN	CNAME	attwp7.wavemarket.com.
blog	IN	A 	 69.25.109.177
bundle-staging-web	IN	A	69.25.109.149
bundle-sdf-staging-web1	IN	A	69.25.109.150
bundle-sci-staging-web1	IN	A	69.25.109.151
bundle-sfl-staging-web1	IN	A	69.25.109.152
nortondemo	IN	A 	 66.211.104.220
;notify-dev	IN	A	69.25.109.165
notify-dev	IN	A	66.211.104.173
notify-stable	IN	A	172.26.178.254
notify-stable-lp	IN	A	172.26.179.254
neil-dmz	IN	A	66.211.104.173
;; confluence	IN	CNAME	confluence.engr.wavemarket.com
call-history	IN	CNAME	ec2-50-16-74-207.compute-1.amazonaws.com.
checkin		IN	A 	 69.25.109.189
chef1		IN	A 	66.211.104.150
cnidemo		IN	A	66.211.104.221
cni-android-dev	IN	A	66.211.104.154
cni-android-reg	IN	A	66.211.104.155
cni-internal-demo	IN	A	66.211.104.172
cni-sparkle-staging	IN	A	69.25.109.134
cni-staging-web1	IN	A	69.25.109.222
cte-mockkiln	IN	CNAME	 cte-mockkiln1.evdc.wavemarket.com.
dav		IN	A	66.211.104.229
demo-t-mobilefamilywhere	IN	CNAME	demo.t-mobilefamilywhere.com.
developer	IN	CNAME	ds-developer1
developer.dmz	IN	A	69.25.109.69
dmz-qa-1	IN	A	66.211.104.231
dmz-qa-2	IN	A	66.211.104.232
dmz-qa-3	IN	A	66.211.104.233
dmz-qa-4	IN	A	66.211.104.234
dmz-qa-5	IN	A	66.211.104.235
dmz-qa-6	IN	A	66.211.104.236
dmz-qa-7	IN	A	66.211.104.237
dmz-qa-8	IN	A	66.211.104.238
;dmz-qa-9	IN	A	66.211.104.239
dmz-qa-10	IN	A	66.211.104.240
dna		IN	A	69.25.109.44
git		IN	A	172.24.0.92
git-ext		IN	A	66.211.104.152

graphite-colo	IN	A	69.25.109.57
hourglass	IN	A	66.211.104.240
jira		IN	A	10.39.4.102
kiln-cte	IN	A	66.211.104.206
kiln-cte-services	IN	A	66.211.104.242
kira-vm3	IN	A	66.211.104.151
globic-telefonica-finder		IN	A	66.211.104.222
hq-ejabberd-1	IN	A	66.211.104.224
vci-various1	IN	A	66.211.104.225
vci-various2	IN	A	66.211.104.183
vci-fst		IN	A	69.25.109.154
old-ota		IN	A	66.211.104.160
ota		IN	A	66.211.104.165
openup		IN	A	66.211.104.223
mirage-dev	IN	A	66.211.104.164
mirage		IN	A	69.25.109.240
mirage-stable		IN	A	69.25.109.182
new-ota		IN	A	66.211.104.165
new-git		IN	A	66.211.104.230
nota		IN	CNAME	new-ota
notify		IN	A	69.25.109.185
notify-lp		IN	A	69.25.109.186
palomino-staging1	IN	A	66.211.104.252
locationlabsdemo	IN	A	66.211.104.209
locatephones	IN	CNAME	ota
lldemo		IN	CNAME	locationlabsdemo
rabbit		IN	CNAME	ec2-107-21-87-157.compute-1.amazonaws.com.
sci-int		IN	A	66.171.207.219
sci-loadtest-int	IN	A	69.25.109.219


; BOX IS DOWN - IP TAKEN BY SOMETHING ELSE NOW sdf-android-dev	IN	A	69.25.109.129
sdf-demo	IN	A	66.171.207.216
sdf-staging-web1	IN	A	69.25.109.133
sdf-int		IN	A	10.249.0.132
sfl.support	IN	CNAME 	sfl4.zendesk.com.
sgb-web		IN	A	66.171.207.217
sgb-web-stable	IN	A	69.25.109.19
sfp-locator-mobile	IN	A	66.171.207.216
sfp-locator-wap-stable	IN	A	69.25.109.28
sfp-retail-web-stable	IN	A	69.25.109.29
sci-web-stable	IN	A	69.25.109.31
sfp-locator-mobileweb-stable	IN	A	69.25.109.32
sdf-web-stable	IN	A	69.25.109.33
sfp-locator-mobileweb	IN	A	66.171.207.209
sfp-locator-wap	IN	A	66.171.207.215
sfp-locator-web	IN	A	66.171.207.216
sfp-locator-web1o	IN	A	69.25.109.248
sfp-locator-admin	IN	A	69.25.109.247
sfp-locator-int	IN	CNAME	sfp-locator-int.sfdc.wavemarket.com.
sfp-core	IN	A	69.25.109.249
sfp-notify	IN	A	69.25.109.228
;sftp		IN	A	66.211.104.156 - now afm-web-staging
sdm-test	IN	A	66.211.104.170
;sfl-split-staging1	IN	A	69.25.109.241
bundle-staging-core1	IN	A	69.25.109.241
sfl-split-staging2	IN	A	69.25.109.244
sfl-split-staging3	IN	A	69.25.109.197
sfl-split-staging4	IN	A	69.25.109.112
sfl-split-staging5	IN	A	69.25.109.250
sfl-split-staging6	IN	A	69.25.109.224
sfl-test-wap		IN	A	69.25.109.251
sfl-api-shim		IN	A	66.171.207.221
sprintmobilecontrols	IN	A	66.211.104.216
sprint-bundle-demo	IN	A	69.25.109.146
sprint-locator-staging-web1	IN	A	66.211.104.239
sprint-prod-demo1	IN	A	69.25.109.145
sprint-prod-demo2	IN	A	69.25.109.141
sprint-retail-staging	IN	A	69.25.109.105
sprint-sms-dev		IN	A	66.211.104.143
sprint-sms-stable	IN	A	69.25.109.148
sprint-incoming-sms	IN	A	66.171.207.233
sprint-sms	IN	A	69.25.109.60
sproxy-web	IN	A	69.25.109.192
sproxy-wap	IN	A	69.25.109.193
sprint-retail-listener	IN	CNAME	sfp-sms-listener.locationlabs.com.
sfp-sms-listener	IN	A	66.171.207.223
sfp-retail-web	IN	A	66.171.207.210
; staging		IN  cname	ec2-204-236-207-123.compute-1.amazonaws.com.
; testing		IN  cname	ec2-204-236-207-123.compute-1.amazonaws.com.
staging		IN  cname	ec2-54-225-48-225.compute-1.amazonaws.com.
testing		IN  cname	ec2-54-225-48-225.compute-1.amazonaws.com.
teleconf	IN	A	66.211.104.159
tfer		IN	A	66.211.104.147
tlf-nagios IN      A       176.34.203.228
tlf-web-staging IN      A       69.25.109.155
tlf-web-staging2 IN      A       69.25.109.156
tlf-sentry      IN      cname   ec2-176-34-208-123.eu-west-1.compute.amazonaws.com.
tlf-billing-test1      IN      cname   ec2-46-137-163-131.eu-west-1.compute.amazonaws.com.
tlf-billing-test2      IN      cname   ec2-54-247-123-60.eu-west-1.compute.amazonaws.com.
tlf-android-dev	IN	A	66.211.104.174
tlf-web1	IN	A	176.34.183.213
tlf-web2	IN	A	176.34.183.223
tmo-lvs	IN	A	69.25.109.216
tmo-locator-int		IN	A	10.209.4.50
tmo-android-locator-staging1	IN	A	66.211.104.198
tmo-demo	IN	A	69.25.109.77
tmo-locator-core-web		IN	A	66.171.207.130
tmo-operations		IN	A	69.25.109.113
tmo-admin		IN	A	10.209.4.201
tmo-stag-loc	IN	A	69.25.109.106
tmo-stag-cni	IN	A	69.25.109.207
tmo-stable-core-web	IN	A	66.211.104.132	
tmo-demo1	IN	CNAME	tmo-demo.locationlabs.com.
wave1		IN	A 	66.150.250.162
wave2		IN	A 	66.150.250.166
;;; $INCLUDE /etc/bind/zones/mailrecords.include webmail
sparkle-stable	IN	A	69.25.109.104
sparkle-dev	IN	A	66.211.104.184
; sparkle-elephant	IN	A	66.211.104.187
; DO NOT ENABLE THIS ITS NOW A BOX sparkle-dev-verizon	IN	A	69.25.109.195
sparkle-dev-verizon	IN	A	66.211.104.175
sparkle-appdev-verizon	IN	A	69.25.109.198
;; sparkle-dev-att	IN	A	69.25.109.236
sparkle-att	IN	A	69.25.109.236
sparkle-tmp	IN	A	69.25.109.237
sparkle-test	IN	A	69.25.109.128
snore	IN	CNAME	sparkle-test.locationlabs.com.
sparkle-staging-web	IN	A	69.25.109.174
sparkle-staging	IN	CNAME	sparkle-staging-web
tom	IN	CNAME	sparkle-staging-web
c-sparkle-web	IN	A	69.25.109.173
c-sparkle	IN	CNAME	c-sparkle-web
sparkle-web	IN	A	69.25.109.173
sparkle		IN	CNAME	sparkle-web
tmo-stag-loc	IN	A	69.25.109.106
vz-web		IN	A	69.25.109.175
vz-plchldr4whtlst	IN	A	69.25.109.176
vz-plchldr4whtlst	IN	A	69.25.109.102
vz-plchldr4whtlst	IN	A	69.25.109.103
vz-plchldr4whtlst	IN	A	69.25.109.104
vz-plchldr4whtlst	IN	A	69.25.109.105
vci-core-dev1	IN	A	69.25.109.253
;vci-core-android-dev1	IN	A	69.25.109.238
vci-core-android-dev1	IN	CNAME	vci-mobile-stable-core.locationlabs.com
vci-mobile-stable-core	IN	A	66.211.104.190
;;;vci-mobile-stable-services	IN	A	66.211.104.191
vci-mobile-stable-services	IN	A	66.211.110.30
;vci-mobile-dev-core	IN	A	66.211.104.192
;;; Should be internal only: see IT-533
vci-mobile-dev-services	IN	A	66.211.110.31
;vci-dev1	IN	A	66.211.104.147
;vci-dev2	IN	A	66.211.104.146
;vci-dev3	IN	A	66.211.104.147
;vci-dev-core	IN	CNAME	vci-dev3.locationlabs.com.
;vci-dev-services	IN	CNAME	vci-dev2.locationlabs.com.
vci-dev-core	IN	A 	66.211.104.147
vci-dev-services	IN	A	66.211.104.146
vci-ext-stable-notify	IN	A   69.25.109.190
vci-ext-stable-notify-lp	IN	A   69.25.109.158
vci-ext-stable-seti	IN	CNAME	vci-ext-stable-seti.sfdc.wavemarket.com.
vci-seti-api	IN	CNAME	vci-seti-api.sfdc.wavemarket.com.
vci-finder-api	IN	A	69.25.109.143
vci-scale-core-api-ext	IN	A	66.211.104.182
vci-scale-core-api	IN	CNAME	vci-scale-core-api.evdc.wavemarket.com.
vci-scale-hs-query	IN	CNAME	vci-scale-hs-query.evdc.wavemarket.com.
vci-scale-hs-write	IN	CNAME	vci-scale-hs-write.evdc.wavemarket.com.
vci-scale-incoming-event-queue	IN	CNAME	vci-scale-incoming-event-queue.evdc.wavemarket.com.
vci-scale3-core-api	IN	CNAME	vci-scale3-core-api.evdc.wavemarket.com.
vci-scale3-seti	IN	CNAME	vci-scale3-seti.evdc.wavemarket.com.
vci-scale3-hs-query	IN	CNAME	vci-scale3-hs-query.evdc.wavemarket.com.
vci-scale3-hs-write	IN	CNAME	vci-scale3-hs-write.evdc.wavemarket.com.
vci-scale3-incoming-event-queue	IN	CNAME	vci-scale3-incoming-event-queue.evdc.wavemarket.com.
; Delete me after May 2015:
vci-stable1	IN	CNAME	vci-stable-core.locationlabs.com
vci-stable2	IN	CNAME	vci-stable-core.locationlabs.com
vci-stable3	IN	CNAME	vci-stable-core.locationlabs.com
;vci-stable-core IN 	CNAME	vci-stable1.locationlabs.com.
;vci-stable-services IN 	CNAME	vci-stable2.locationlabs.com.
vci-stable-core IN 	A	66.211.104.135
vci-stable-services IN 	A	66.211.104.136

sparkle-verizon	IN	A	69.25.109.166
vci-core-api	IN	A	69.25.109.252
vci-core-account	IN	A	10.249.0.180
;vci-core-api	IN	A	69.25.109.102
vci-api-locator	IN	A	69.25.109.143
;vci-api-locator	IN	A	69.25.109.103
;vzw-sparkle	IN	CNAME   sparkle
;vzw-sparkle	IN	A	69.25.109.104
vzwfb-mobile-clients	IN	A	69.25.109.176
vci-notify      IN      A       69.25.109.26
vci-integration-ub	IN	A	69.25.109.169
vci-integration-vision	IN	A	69.25.109.145
vci-incoming-event-queue	IN	CNAME   vci-incoming-event-queue.sfdc.wavemarket.com.
vci-notify-lp	IN	CNAME	vci-notify-lp.sfdc.wavemarket.com.
vci-notify-lp-rabbit	IN	CNAME	vci-notify-lp-rabbit.sfdc.wavemarket.com.

;; all but vci-secondary-sparkle is currently (2013 Mar 12) dummy servers
vci-secondary-core-api		IN	A	69.25.109.102
vci-secondary-finder-api	IN	A	69.25.109.103
vzw-secondary-sparkle		IN	A	69.25.109.104
vci-secondary-mobile-web	IN	A	69.25.109.105


vci-ext-stable-core-api IN A             69.25.109.116
vci-ext-stable-api-locator IN A            69.25.109.117
vci-ext-stable-mobile-web IN A            69.25.109.118
vci-ext-stable-core-account IN A 	10.249.0.169
vci-ext-stable-incoming-event-queue IN A 	10.249.0.187
vci-ext-stable-clidor 	IN	A	69.25.109.231
vzwfb-lab-mobile-clients 	IN	CNAME	vci-ext-stable-clidor.locationlabs.com.
familybasedemo 	IN	CNAME	vci-ext-stable-clidor.locationlabs.com.

vci-pilot-stable-core	IN	A	69.25.109.161
vci-pilot-stable-kiln	IN	A	69.25.109.167
vci-ext-stable-integration-ub	IN	A	69.25.109.208
vci-ext-stable-integration-vision	IN	A	69.25.109.144
vci-ext-stable-ub	IN	CNAME	vci-ext-stable-integration-ub.locationlabs.com.
; ALIASES FOR THE PILOT STABLE. DO NOT USE CNAMES.
vci-pilot-stable-core-api	IN 	A	69.25.109.161
;vci-pilot-stable-api-locator	IN 	A
vci-pilot-stable-notify	IN 	A	 69.25.109.167
;vci-pilot-stable-verizon-sms	IN 	A
;vci-scale-core-api	IN	A	66.211.104.141
;vci-scale-hs-write	IN	A	66.211.104.142
;vci-scale-hs-query	IN	A	66.211.104.143
;vci-scale-incoming-event-queue	IN	A	66.211.104.144

vzw-db-metrics	IN	A	69.25.109.154
nagios3		IN	CNAME	vci-lnm-gateway
sfp-kafka-offset	IN	CNAME	vci-lnm-gateway
sfp-grafana	IN	CNAME	vci-lnm-gateway
sfp-influxdb	IN	CNAME	vci-lnm-gateway
sfp-tilden-nagios	IN	CNAME	vci-lnm-gateway
sfp-kibana	IN	CNAME	vci-lnm-gateway
sfp-elasticsearch	IN	CNAME	vci-lnm-gateway
vci-lnm-k3	IN	CNAME	vci-lnm-gateway
vci-lnm-monitoring	IN	CNAME	vci-lnm-gateway
vci-lnm-metrics	IN	CNAME	vci-lnm-gateway
vci-lnm-logs	IN	CNAME	vci-lnm-gateway
vci-lnm-grafana IN	CNAME	vci-lnm-gateway
vci-ext-stable-metrics	IN	CNAME	vci-lnm-gateway
vci-ext-stable-logs	IN	CNAME	vci-lnm-gateway
vci-lnm-gateway	IN	A	69.25.109.154
vci-clidor	IN	A	69.25.109.179
; Before you go and make this a real thing, check if the error Verizon
; sent you is caused by trying to log in with a user that is not real
; verizon-mtas	IN	A	69.25.109.9
; vzw-mtas	IN	CNAME	verizon-mtas
;DO NOT ACTIVATE, this is now afm-sms-staging1;  verizon-sms	IN	A	69.25.109.223 ; should be .166, not .223
verizon-sms	IN	A	69.25.109.166
verizon-sms-rabbit	IN	CNAME verizon-sms
verizon-sms-stable	IN	CNAME	sparkle-appdev-verizon
verizon-sms-dev		IN	CNAME	sparkle-dev-verizon
; vzw-sparkle is set now as a cname to sparkle for dev.  when vzw-sparkle is it's own thing this should be changed to the below entry.
vzw-sparkle	IN	A	69.25.109.168
vci-event	IN	A	10.249.0.254
diary-web1	IN	A	66.211.104.158
messaging-gateway-dev	IN	CNAME	messaging-gateway-dev.evdc.wavemarket.com.
messaging-gateway-stable	IN	A	69.25.109.148
tsprint-tracking	IN	A	66.211.104.169
attrs-stable	IN	A	69.25.109.42
test-sfl-mobile 	IN	A	69.25.109.18
indigo-dev1	IN	A	66.211.104.196
finder-api-dev	IN	A	66.211.104.197
;finder-api-dev	IN	CNAME	finder-api-dev.evdc.wavemarket.com.
afm-staging-db	IN	CNAME	afm-staging-db.sfdc.wavemarket.com.
afm-sms-staging1	IN	A 69.25.109.223
;; AFMI-6659 cname to shorten url pending go-ahead by product team
; afm-stg IN CNAME afm-web-staging
; afm-stb IN CNAME afm-stable-web
afm-web-staging	IN	A	66.211.104.156

;; DVOP-1038 reversion
afm-web-stable	IN	A	66.211.104.199

;; IG-1422
afm-stable-web  IN      CNAME   afm-web-stable

afm-lps-network-staging	IN	A	66.211.104.212
afm-rs-dev1	IN	A	66.211.104.148
receipts-dev    IN      CNAME   afm-rs-dev1
receipts-staging1	IN	A	66.211.104.196
receipts	IN	A	69.25.109.121
;; ITSS-4341.  This was initially AT&T-specific, now we also have a generic cross-carrier
;; receipts-stable. Note: we cannot use cnames as MX records, so leave as-is in case there are MX
;; records pointing here from outside this zone.
receipts-stable     IN  A   66.211.104.192
att-receiptservice-stable    IN  A   66.211.104.192
inviteafm-dev	IN	A	66.211.104.149
inviteafm-stable	IN	A	66.211.104.195
sigur-dev1	IN	A	66.211.104.194
sigur-stable1	IN	A	66.211.104.224
greeneggs-stable	IN	A	66.211.104.217
greeneggs-dev	IN	A	66.211.104.218
finder-api-stable	IN	A	66.211.104.189
apns-gateway	IN	A	69.25.109.98
sigur-staging1	IN	A	66.211.104.139
afm-int-staging1	IN	A	66.211.104.251
afm-services-stable	IN	A	66.211.104.200
ros-staging	IN	A	66.211.104.230
sfl-mobile-web-staging	IN	A	66.211.104.226
att-provision-staging	IN	A	66.211.104.215
att-provision	IN	A	69.25.109.101
;; hackday shittiness
;may no longer exist?beagle-dev	IN	A	66.211.104.141
tilden-beta-api	IN	A	66.211.104.181
tilden-beta-services	IN	CNAME	tilden-beta-service1.evdc.wavemarket.com.
tilden-dev-services	IN	CNAME tilden-dev-services.evdc.wavemarket.com.
tilden-dev-api IN      A       66.211.104.238
hack514	IN	A	66.211.104.193
carter	IN	A	66.211.104.201
;; end of hackday shittiness
latest-attfm-automated	IN	CNAME	latest-attfm-automated.evdc.wavemarket.com.
rs-qa-automated	IN	CNAME	rs-qa-automated.evdc.wavemarket.com.
aci-cte-hp-tguard-mock	IN	CNAME	aci-cte-hp-tguard-mock.evdc.wavemarket.com.
it-bastion	IN	A	66.171.207.254
afm-dev-provision1	IN	A	66.211.104.174
afm-stable-provision1	IN	A	66.211.104.188

;;new ACI stuff
aci-prod-contact-api	IN	CNAME	aci-prod-contact-api.aci.sfdc.wavemarket.com.
aci-prod-core-account	IN	CNAME	aci-prod-core-account.aci.sfdc.wavemarket.com.
aci-prod-history-store	IN	CNAME	aci-prod-history-store.aci.sfdc.wavemarket.com.
aci-prod-incoming-eq-api	IN	CNAME	aci-prod-incoming-eq-api.aci.sfdc.wavemarket.com.
aci-prod-cdr-bookkeeper	IN	CNAME	aci-prod-cdr-bookkeeper.aci.sfdc.wavemarket.com.
aci-prod-cdr-cons-store	IN	CNAME	aci-prod-cdr-cons-store.aci.sfdc.wavemarket.com.
aci-prod-cdr.sched-cache	IN	CNAME	aci-prod-cdr.sched-cache.aci.sfdc.wavemarket.com.
aci-prod-cdr-pub-api	IN	CNAME	aci-prod-cdr-pub-api.aci.sfdc.wavemarket.com.
aci-prod-cdr-pub-core	IN	CNAME	aci-prod-cdr-pub-core.aci.sfdc.wavemarket.com.
aci-prod-core-scheduler-q	IN	CNAME	aci-prod-core-scheduler-q.aci.sfdc.wavemarket.com.
;; ITSS-4365
aci-prod-smpp-gateway	IN	CNAME	aci-prod-smpp-gateway.aci.sfdc.wavemarket.com.
aci-prod-thirdparty-services	IN	CNAME	aci-prod-thirdparty-services.aci.sfdc.wavemarket.com.
aci-prod-notification-qr	IN	A	66.171.207.242
aci-prod-core-api	IN	A	66.171.207.230
aci-incoming-3pp	IN	A	66.171.207.231
aci-prod-api-locator IN	A	66.171.207.226
aci-prod-webapp	IN	A	66.171.207.227
aci-prod-supporttool	IN	A	66.171.207.228
aci-csr	IN	CNAME	aci-prod-supporttool.locationlabs.com.
aci-prod-mock	IN	A	66.171.207.229
aci-mobile-clients	IN	A	66.171.207.229
;; ITSS-4591
smartlimitsdemo		IN	A	66.171.207.224
aci-prod-versioning	IN	A	66.171.207.225
aci-prod-seti-api	IN	CNAME	aci-prod-seti-api.aci.sfdc.wavemarket.com.

;; ITSS-4504
;; WARNING: This box doesn't exist yet, it is here as a placeholder.
;; Please don't delete it.
aci-prod-recon		IN	A	66.171.207.232

test-sfl-shim	IN	A	69.25.109.17
vci-mobile-dev-core	IN	A	66.211.110.110

sfp-staging-retail-web	IN	A	66.211.104.177
sfp-staging-ros		IN      A       66.211.104.202
sfp-staging-sigur	IN      A       66.211.104.203
sfl-staging-api-shim	IN	A	66.211.104.208
sfl-sherlock IN A 66.171.207.212

; Now un-needed by sprint
; sgp-staging-web 	IN	A	66.211.104.145
sci-staging-web 	IN	A	66.211.104.209
sci-staging-int 	IN      A       66.211.110.35
sdf-staging-web	IN	A	66.211.104.213
sfp-staging-locator-web	IN	A	66.211.104.185
sfp-staging-locator-wap	IN	A	66.211.104.186
sfp-staging-locator-core	IN	A	66.211.104.187
sprint-staging-incoming-sms	IN	A	66.211.104.138
;sfl-staging-web	IN	A	66.211.104.181
sfl-staging-wap	IN	A	66.211.104.214
sfp-staging-sms-listener	IN	A	66.211.104.170
sfp-staging-retail-web		IN	A	66.211.104.177
sfp-staging-locator-int 	IN      A       66.211.110.36
sfl-stable-tux	IN	CNAME	sfl-stable-tux.evdc.wavemarket.com.

;; sfl testing
;; Moving those to wavemarket.com for ITSS-4464
;;sfp-dev-sigur             IN      A       66.211.110.21
;;sfp-dev-ros             IN      A       66.211.110.22
;;sfp-stable-sigur                IN      A       66.211.110.23
;;sfp-stable-ros          IN      A       66.211.110.24
;;sfl-stable-web          IN      A       66.211.110.26
sfl-staging-web1                IN      A       66.211.110.27
sfl-staging-web2                IN      A       66.211.110.28

; interview
interview		IN	A	66.211.110.116

; vci receipts
vci-receipts	IN	A	69.25.109.83
vci-ext-stable-receipts	IN	A	69.25.109.84

;; ITSS-4636, moved in IG-1432
;;docker-images	IN	A	66.211.110.178
docker-images	IN	A	66.171.207.20

;; ITSS-4847
;; Renamed in ITSS-5186
tilden-afm-dev1	IN	CNAME	tilden-afm-dev1.evdc.wavemarket.com.

;; ITSS-4848
afm-tilden-stable1	IN	CNAME	afm-tilden-stable1.evdc.wavemarket.com.

;; ITSS-4728
viaduct-dev	IN	A	66.211.110.11
viaduct-stable	IN	CNAME	viaduct-stable.evdc.wavemarket.com

;; ITSS-4935
rockwell-apns-gateway	IN	A	54.183.20.83

;; AFM
afm-web	IN	A	66.171.207.144
afm-mobile-web	IN	A	66.171.207.146
;; IG-446
afm-mobile-web-staging	IN	A	66.211.110.42
lps-sparkle-callback	IN	A	66.171.207.147
afm-3pp-event	IN	A	66.171.207.148
afm-qpass-event	IN	A	66.171.207.149
afm-olam-event	IN	A	66.171.207.150
afm-sp-web	IN	A	66.171.207.151
afm-sigur	IN	A	66.171.207.152
afm-ros	IN	A	66.171.207.153
afm-sherlock	IN	A	66.171.207.154
afm-checkin	IN	A	66.171.207.155
location-afm	IN	A	66.171.207.156

;; IG-75 need to migrate OLAM endpoint into 66.171.207.224/28
afm-olam-event-ig-75	IN	A	66.171.207.234

;; Please do not use the following two ips, they are reserved for the EAG-to-NGEAG migration of afm
;; and aci smpp and lps flows (COPS-177).  Names are provisional and subject to change, but the IPs
;; are the last two addresses in the 66.171.207.224/28 subnet (which was originally supposed to be
;; AT&T-only).

;; att-pxtl-source IN A 66.171.207.235
;; att-smpp-source IN A 66.171.207.239

;; ITSS-4939
tilden-afm-stable	IN	A	66.211.104.155

; fisheye internal
fisheye	IN	CNAME	fisheye.evdc.wavemarket.com.
;don't ask.  or ask joe.
localhost	IN	A	127.0.0.1
joescript	IN	A	66.211.104.165

;; ITSS-4925
afm-lps-network-dev1	IN	CNAME	afm-lps-network-dev1.evdc.wavemarket.com.
afm-lps-network-stable1	IN	CNAME	afm-lps-network-stable1.evdc.wavemarket.com.
;; ITSS-5021 - take old afm-int-staging1 and make afm-location-api-staging
afm-location-api-staging	IN	A	66.211.104.252

;; tilden-ti-stable-all for ITSS-4849
tilden-ti-stable-all	IN	A	66.211.104.134
;; tilden-ti-stable for ITSS-5073
tilden-ti-stable-api	IN	A	66.211.110.13

;; ITSS-5082
location-afm-int	IN	CNAME	location-afm-int.afm.sfdc.wavemarket.com.

;; ITSS-4601 and ITSS-5085
dev-log-gateway	IN	CNAME	kibana-dev1.evdc.wavemarket.com.

;; T-Mobile External Notification endpoint for ITSS-5135
;; tfw-lab-sdg	IN	CNAME	viaduct-dev.locationlabs.com.
tfw-lab-sdg		IN	A	66.171.207.131

;;  TFW 3pg NOT 131?
3pg-api		IN	CNAME	3pg-api.tfw.sfdc.wavemarket.com.
tfw-sdg		IN	A	66.171.207.131

;; IG-245
tfw-finder-dev		IN	A	66.211.104.243
tfw-dev-notify		IN	CNAME	tfw-dev-notify.evdc.wavemarket.com.

;; IG-246
pre-web-tfw     IN  A            66.171.207.130
pre-tilden-api-tfw IN A          66.171.207.131

;; Test server for new version of Openfire (not public anymore)
;openfire-test	IN	A	66.211.110.109
;_xmpp-client._tcp.openfire-test	IN	SRV 0 10 5222 openfire-test.locationlabs.com.
;jabber-test	IN	CNAME	openfire-test
;_xmpp-client._tcp.jabber-test	IN	SRV 0 10 5222 jabber-test.locationlabs.com.

ca		IN	A	66.211.104.165

;; DVOP-45
sfl-pre-api	IN	A	66.171.207.208
sfl-pre-mobile-web	IN	A	66.171.207.209
sfl-pre-retail-web	IN	A	66.171.207.210
sfl-pre-ros	IN	A	66.171.207.211
sfl-pre-shim-api	IN	A	66.171.207.221
sfl-pre-sigur	IN	A	66.171.207.222
sfl-pre-sparkle-callback	IN	A	66.171.207.214
sfl-pre-wap	IN	A	66.171.207.215
sfl-pre-web	IN	A	66.171.207.216
sgb-pre-web	IN	A	66.171.207.217
smc-pre-api	IN	A	66.171.207.218
smc-pre-sparkle-callback	IN	A	66.171.207.219
smc-pre-web	IN	A	66.171.207.220

sfl-pre-sms-listener    IN  A   66.171.207.223
sfl-pre-incoming-sms    IN  A   66.171.207.233

;; Jabber server in EVDC (TOOL-1147)
jabber	IN	A	66.211.110.109
_xmpp-client._tcp.jabber  IN      SRV 0 10 5222 jabber.locationlabs.com.
;; TOOL-1350
confluence	IN	CNAME	confluence-prod.engr.wavemarket.com.
;; DVOP-932
tilden-sfp-staging-all1	IN	A	66.211.110.14
;; DVOP-910
sfp-staging-sherlock IN A 66.211.110.15
;; SFL-15854
familysafety-sprint	IN	A	66.171.207.217
mobilecontrols-sprint	IN	A	66.171.207.220
drivefirst-sprint	IN	A	69.25.109.131
sfl-sprint	IN	A	66.171.207.210
sfl-sprintpcs	IN	A	69.25.109.90

vlan66-ssh-gw	IN	A	69.25.109.25
vlan66-ssh-gw	IN	A	69.25.109.245

;;TOOL-1491
crashlytics-integration	IN	CNAME	ota

;; DVOP-1131
vci-mobile-redir	IN	A	69.25.109.225

;; DVOP-1141
ott-stable-all	IN	A	66.211.110.18

;; IG-379
tmo-stable-core-web	IN	A	66.211.110.19

;; IG-320
afm-services-dev	IN	A	66.211.110.20

;; IG-325
afm-web-dev     IN A    66.211.110.24
tilden-afm-dev  IN A    66.211.110.26

;; IG-776
vci-apns-gateway IN A   69.25.109.110
vci-ext-stable-apns-gateway IN A 69.25.109.109

;; IG-886 
aws-vpn1	IN	A	66.211.110.43
aws-vpn2	IN	A	66.211.110.44

;; IG 1168
aci-prod-kafka	IN	A	66.211.110.45
aci-prod-zookeeper	IN	A	66.211.110.46
vci-kafka	IN	A	66.211.110.47
vci-zookeeper	IN	A	66.211.110.48

;; IG-1265
afm-alert-system-staging	IN	A	66.211.110.49

;; IG-1186 - remove after afm release - EVDC boxes =(
afm-olam-event-staging1	IN	A	66.211.110.50
afm-qpass-event-staging1	IN	A	66.211.110.51

;; IG-1313
vci-elk-gateway	IN	A	69.25.109.145

;;IG-1231 VIPs
aci-prod-sendgrid-gateway	IN	A	66.171.207.232
vci-sendgrid-gateway	IN	A	69.25.109.211

;; IG-423
aci-prod-apns-gateway	IN	CNAME	aci-prod-apns-gateway.aci.sfdc.wavemarket.com.
aci-cte-apns-gateway	IN	CNAME	aci-cte-apns-gateway.evdc.wavemarket.com.

;; IG-1495
;;notify-dev-bak	IN	A	66.211.104.253 

;; IG-1613
aci-prod-es-logstash1	IN	CNAME	aci-prod-es-logstash1.aci.sfdc.wavemarket.com.
aci-prod-es-logstash2	IN	CNAME	aci-prod-es-logstash2.aci.sfdc.wavemarket.com.
aci-prod-es-logstash3	IN	CNAME	aci-prod-es-logstash3.aci.sfdc.wavemarket.com.
aci-prod-es-logstash4	IN	CNAME	aci-prod-es-logstash4.aci.sfdc.wavemarket.com.
log-central-dev1	IN	CNAME	log-central-dev1.evdc.wavemarket.com.

;; IG-1217
location-afm-ext	IN	A	66.171.207.145

;; IG-514
aci-dev-docker	IN	A	66.211.110.52	
aci-stable-docker	IN	A	66.211.110.53
aci-mobile-stable-docker	IN	A	66.211.110.51
aci-autodeploy-docker	IN	CNAME	aci-autodeploy-docker.evdc.wavemarket.com.

;; IG-1645
aci-lab-docker	IN	CNAME	aci-lab-docker.sfdc.wavemarket.com.
aci-cte-docker	IN	CNAME	aci-cte-docker.evdc.wavemarket.com.

;; IG-1870
tfw-viaduct-dev	IN	CNAME	tfw-viaduct-dev.evdc.wavemarket.com.

;; IG-1964
aci-feature-docker	IN	CNAME	aci-feature-docker.evdc.wavemarket.com.
;;; $INCLUDE /etc/bind/zones/multi
;;; $INCLUDE /etc/bind/zones/e-locationlabs.save
