$ORIGIN .
$TTL 300	; 5 minutes
locationlabs.com	IN SOA	ns1.locationlabs.com. hostmaster.locationlabs.com. (
				112474     ; serial
				900        ; refresh (15 minutes)
				600        ; retry (10 minutes)
				86400      ; expire (1 day)
				300        ; minimum (5 minutes)
				)
			NS	ns1.locationlabs.com.
			NS	ns2.locationlabs.com.
$TTL 600	; 10 minutes
			A	172.18.64.2
			A	172.18.64.3
			A	192.168.12.1
			A	192.168.12.2
$TTL 3600	; 1 hour
			MX	10 mail.us.avg.com.
$TTL 600	; 10 minutes
			AAAA	fdd0:96d4:3d5f:0:184d:80fe:425c:5f8e
			AAAA	fdd0:96d4:3d5f:0:789e:e236:dee6:59d5
$ORIGIN locationlabs.com.
$TTL 3600	; 1 hour
3pg-api			CNAME	3pg-api.tfw.sfdc.wavemarket.com.
_amazonses		TXT	"KxI41ZTFg+jUo4A05z59+djSKVeD0t9zgPIuIQNsuyw="
_msdcs			NS	ns1
$ORIGIN _tcp.Default-First-Site-Name._sites.locationlabs.com.
$TTL 600	; 10 minutes
_gc			SRV	0 100 3268 hq-ad-1.locationlabs.com.
			SRV	0 100 3268 hq-ad-2.locationlabs.com.
_kerberos		SRV	0 100 88 hq-ad-1.locationlabs.com.
			SRV	0 100 88 hq-ad-2.locationlabs.com.
_ldap			SRV	0 100 389 hq-ad-1.locationlabs.com.
			SRV	0 100 389 hq-ad-2.locationlabs.com.
$ORIGIN _tcp.locationlabs.com.
_gc			SRV	0 100 3268 hq-ad-1.locationlabs.com.
			SRV	0 100 3268 hq-ad-2.locationlabs.com.
_kerberos		SRV	0 100 88 hq-ad-1.locationlabs.com.
			SRV	0 100 88 hq-ad-2.locationlabs.com.
_kpasswd		SRV	0 100 464 hq-ad-1.locationlabs.com.
			SRV	0 100 464 hq-ad-2.locationlabs.com.
_ldap			SRV	0 100 389 hq-ad-1.locationlabs.com.
			SRV	0 100 389 hq-ad-2.locationlabs.com.
$ORIGIN _udp.locationlabs.com.
_kerberos		SRV	0 100 88 hq-ad-1.locationlabs.com.
			SRV	0 100 88 hq-ad-2.locationlabs.com.
_kpasswd		SRV	0 100 464 hq-ad-1.locationlabs.com.
			SRV	0 100 464 hq-ad-2.locationlabs.com.
$ORIGIN locationlabs.com.
$TTL 3600	; 1 hour
aci-3pp-lab		A	66.211.104.177
aci-appdev		A	69.25.109.138
aci-appstore-core	A	69.25.109.129
aci-appstore-services	A	69.25.109.130
aci-autodeploy-core	CNAME	aci-autodeploy-core.evdc.wavemarket.com.
$TTL 300	; 5 minutes
aci-autodeploy-docker	CNAME	aci-autodeploy-docker.evdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-autodeploy-services	A	172.28.153.16
aci-csi-lab		A	66.211.104.176
aci-csr			CNAME	aci-prod-supporttool
aci-csr-lab		A	69.25.109.171
aci-cte-3pp-core	CNAME	aci-cte-3pp-core.evdc.wavemarket.com.
aci-cte-api-locator	CNAME	aci-cte-api-locator.evdc.wavemarket.com.
$TTL 300	; 5 minutes
aci-cte-apns-gateway	CNAME	aci-cte-apns-gateway.evdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-cte-cdr-bookkeeper	CNAME	aci-cte-cdr-bookkeeper.evdc.wavemarket.com.
aci-cte-cdr-cons-store	CNAME	aci-cte-cdr-cons-store.evdc.wavemarket.com.
aci-cte-cdr-pub-api	CNAME	aci-cte-cdr-pub-api.evdc.wavemarket.com.
aci-cte-cdr-pub-core	CNAME	aci-cte-cdr-pub-core.evdc.wavemarket.com.
aci-cte-cdr-sched-cache	CNAME	aci-cte-cdr-sched-cache.evdc.wavemarket.com.
aci-cte-cdr-sched-qr	CNAME	aci-cte-cdr-sched-qr.evdc.wavemarket.com.
aci-cte-cdr-scheduler-q	CNAME	aci-cte-cdr-scheduler-q.evdc.wavemarket.com.
aci-cte-contact-api	CNAME	aci-cte-contact-api.evdc.wavemarket.com.
aci-cte-core-account	CNAME	aci-cte-core-account.evdc.wavemarket.com.
aci-cte-core-api	CNAME	aci-cte-core-api.evdc.wavemarket.com.
aci-cte-core-scheduler	CNAME	aci-cte-core-scheduler.evdc.wavemarket.com.
$TTL 300	; 5 minutes
aci-cte-docker		CNAME	aci-cte-docker.evdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-cte-history-store	CNAME	aci-cte-history-store.evdc.wavemarket.com.
aci-cte-hp-csi-mock	CNAME	aci-cte-hp-csi-mock.evdc.wavemarket.com.
aci-cte-hp-emcsi-mock	CNAME	aci-cte-hp-emcsi-mock.evdc.wavemarket.com.
aci-cte-hp-tguard-mock	CNAME	aci-cte-hp-tguard-mock.evdc.wavemarket.com.
aci-cte-ieq-mock	CNAME	aci-cte-ieq-mock.evdc.wavemarket.com.
aci-cte-incoming-eq-api	CNAME	aci-cte-incoming-eq-api.evdc.wavemarket.com.
aci-cte-mock		CNAME	aci-cte-mock.evdc.wavemarket.com.
aci-cte-seti-api	CNAME	aci-cte-seti-api.evdc.wavemarket.com.
aci-cte-webapp		CNAME	aci-cte-webapp.evdc.wavemarket.com.
aci-demo		A	69.25.109.139
aci-dev-core		A	66.211.104.178
$TTL 300	; 5 minutes
aci-dev-docker		A	66.211.110.52
$TTL 3600	; 1 hour
aci-dev-services	A	66.211.104.171
$TTL 300	; 5 minutes
aci-feature-core	A	66.211.110.45
aci-feature-docker	CNAME	aci-feature-docker.evdc.wavemarket.com.
aci-feature-services	A	66.211.110.46
$TTL 3600	; 1 hour
aci-incoming-3pp	A	66.171.207.231
aci-lab-core		A	69.25.109.170
aci-lab-core1		A	69.25.109.170
$TTL 300	; 5 minutes
aci-lab-docker		CNAME	aci-lab-docker.sfdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-lab-services	A	69.25.109.171
aci-lab-services1	A	69.25.109.171
aci-mobile-clients	A	66.171.207.229
aci-mobile-stable-core	A	172.28.153.5
$TTL 300	; 5 minutes
aci-mobile-stable-docker A	66.211.110.51
$TTL 3600	; 1 hour
aci-mobile-stable-services A	66.211.104.144
aci-prod-api-locator	A	66.171.207.226
$TTL 300	; 5 minutes
aci-prod-apns-gateway	CNAME	aci-prod-apns-gateway.aci.sfdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-prod-cdr-bookkeeper	CNAME	aci-prod-cdr-bookkeeper.aci.sfdc.wavemarket.com.
aci-prod-cdr-cons-store	CNAME	aci-prod-cdr-cons-store.aci.sfdc.wavemarket.com.
aci-prod-cdr-pub-api	CNAME	aci-prod-cdr-pub-api.aci.sfdc.wavemarket.com.
aci-prod-cdr-pub-core	CNAME	aci-prod-cdr-pub-core.aci.sfdc.wavemarket.com.
aci-prod-contact-api	CNAME	aci-prod-contact-api.aci.sfdc.wavemarket.com.
aci-prod-core-account	CNAME	aci-prod-core-account.aci.sfdc.wavemarket.com.
aci-prod-core-api	A	66.171.207.230
$TTL 300	; 5 minutes
aci-prod-core-rest-api	CNAME	aci-prod-core-rest-api.aci.sfdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-prod-core-scheduler-q CNAME	aci-prod-core-scheduler-q.aci.sfdc.wavemarket.com.
$TTL 300	; 5 minutes
aci-prod-dataplan	CNAME	aci-prod-dataplan.aci.sfdc.wavemarket.com.
aci-prod-es-logstash1	CNAME	aci-prod-es-logstash1.aci.sfdc.wavemarket.com.
aci-prod-es-logstash2	CNAME	aci-prod-es-logstash2.aci.sfdc.wavemarket.com.
aci-prod-es-logstash3	CNAME	aci-prod-es-logstash3.aci.sfdc.wavemarket.com.
aci-prod-es-logstash4	CNAME	aci-prod-es-logstash4.aci.sfdc.wavemarket.com.
$TTL 3600	; 1 hour
aci-prod-history-store	CNAME	aci-prod-history-store.aci.sfdc.wavemarket.com.
aci-prod-incoming-3pp	CNAME	aci-ncoming-3pp
aci-prod-incoming-eq-api CNAME	aci-prod-incoming-eq-api.aci.sfdc.wavemarket.com.
aci-prod-log-gateway	CNAME	aci-prod-log-gateway.aci.sfdc.wavemarket.com.
aci-prod-mock		A	66.171.207.229
aci-prod-notification-qr A	66.171.207.242
aci-prod-recon		A	66.171.207.232
aci-prod-seti-api	CNAME	aci-prod-seti-api.aci.sfdc.wavemarket.com.
aci-prod-smpp-gateway	CNAME	aci-prod-smpp-gateway.aci.sfdc.wavemarket.com.
aci-prod-supporttool	A	66.171.207.228
aci-prod-versioning	A	66.171.207.225
aci-prod-webapp		A	66.171.207.227
aci-sms-lab		A	69.25.109.159
aci-stable-core		A	66.211.104.179
$TTL 300	; 5 minutes
aci-stable-docker	A	66.211.110.53
$TTL 3600	; 1 hour
aci-stable-services	A	66.211.104.180
aci-stage-webapp	A	66.171.207.236
aci-staging-web		A	69.25.109.136
aci-web			A	69.25.109.137
adserver		A	69.25.109.179
adserver-test		A	69.25.109.127
afm-3pp-event		A	66.171.207.148
$TTL 300	; 5 minutes
afm-alert-system-staging A	66.211.110.49
$TTL 3600	; 1 hour
afm-checkin		A	66.171.207.155
afm-db-staging1		CNAME	afm-db-staging1.evdc.wavemarket.com.
afm-dev-provision1	A	66.211.104.174
afm-dev-retail-signup	CNAME	afm-dev-retail-signup.evdc.wavemarket.com.
afm-finder-event	A	66.171.207.147
afm-int-staging1	CNAME	afm-int-staging1.evdc.wavemarket.com.
afm-int-staging2	CNAME	afm-int-staging2.evdc.wavemarket.com.
afm-location-api-staging A	66.211.104.252
afm-lps-network-dev1	CNAME	afm-lps-network-dev1.evdc.wavemarket.com.
afm-lps-network-stable1	CNAME	afm-lps-network-stable1.evdc.wavemarket.com.
afm-lps-network-staging	A	66.211.104.212
afm-mobile-web		A	66.171.207.146
$TTL 300	; 5 minutes
afm-mobile-web-staging	A	66.211.110.42
$TTL 3600	; 1 hour
afm-olam-event		A	66.171.207.150
$TTL 300	; 5 minutes
afm-olam-event-staging1	A	66.211.110.50
$TTL 3600	; 1 hour
afm-qpass-event		A	66.171.207.149
$TTL 300	; 5 minutes
afm-qpass-event-staging1 A	66.211.110.51
$TTL 3600	; 1 hour
afm-ros			A	66.171.207.153
afm-rs-dev1		CNAME	afm-rs-dev1.evdc.wavemarket.com.
$TTL 300	; 5 minutes
afm-services-dev	A	66.211.110.20
$TTL 3600	; 1 hour
afm-services-stable	A	66.211.104.200
afm-sherlock		A	66.171.207.154
afm-sigur		A	66.171.207.152
afm-sp-web		A	66.171.207.151
afm-stable-int1		CNAME	afm-stable-int1.evdc.wavemarket.com.
afm-stable-provision1	A	66.211.104.188
afm-stable-retail-signup CNAME	afm-stable-retail-signup.evdc.wavemarket.com.
afm-stable-web		A	66.211.104.199
afm-task1		A	69.25.109.214
$TTL 300	; 5 minutes
afm-threepp-event-staging1 A	66.211.104.204
$TTL 3600	; 1 hour
afm-wap			A	66.171.207.145
afm-web			A	66.171.207.144
$TTL 300	; 5 minutes
afm-web-dev		A	66.211.110.24
afm-web-stable		A	66.211.104.199
$TTL 3600	; 1 hour
afm-web-staging		A	66.211.104.156
afm-web-staging1	CNAME	afm-web-staging1.evdc.wavemarket.com.
afm-web-staging2	CNAME	afm-web-staging2.evdc.wavemarket.com.
afmwp7demo		CNAME	afmwp7demo.wavemarket.com.
apns-gateway		A	69.25.109.98
applepush-gateway	A	69.25.109.49
apt-cacher		A	192.168.0.141
archive			CNAME	archive.engr.wavemarket.com.
artifactory		CNAME	artifactory.engr.wavemarket.com.
$TTL 300	; 5 minutes
asett-tracking		CNAME	asset-tracking-prod.evdc.wavemarket.com.
$TTL 3600	; 1 hour
asset-tracking		CNAME	asset-tracking-prod.evdc.wavemarket.com.
atest-globic		A	66.211.104.215
att-checkin		A	66.171.207.155
att-checkin-tmp		A	69.25.109.187
att-esl-demo		A	66.211.104.188
att-familywiki-staging	A	66.211.104.219
att-integration		CNAME	lps-sparkle-callback
att-locator-external	A	69.25.109.89
att-locator-external-notify A	69.25.109.89
att-locator-staging-web	A	69.25.109.157
att-provision-staging	CNAME	att-provision-staging.evdc.wavemarket.com.
att-sender2		A	69.25.109.16
att-sms-stable		A	69.25.109.124
att-uverse-staging	A	69.25.109.62
att-uverse-staging2	CNAME	att-uverse-staging
attrs-stable		A	69.25.109.42
attwp7			CNAME	attwp7.wavemarket.com.
$TTL 300	; 5 minutes
autodiscover		CNAME	mail.us.avg.com.
$TTL 3600	; 1 hour
babbage			CNAME	babbage.common.sfdc.wavemarket.com.
beagle-dev		A	66.211.104.141
$TTL 1200	; 20 minutes
BEAST			A	192.168.96.73
$TTL 3600	; 1 hour
beta			CNAME	corpweb
blog			A	69.25.109.177
bower			CNAME	bower.evdc.wavemarket.com.
$TTL 300	; 5 minutes
build-android-1		CNAME	build-android1
$TTL 3600	; 1 hour
build-android1		A	192.168.2.106
bundle-sci-staging-web1	A	69.25.109.151
bundle-sdf-staging-web1	A	69.25.109.150
bundle-sdfu-staging-landing1 CNAME bundle-sdfu-staging-landing1.evdc.wavemarket.com.
bundle-sfl-staging-web1	A	69.25.109.152
bundle-staging-core1	A	69.25.109.241
bundle-staging-web	A	69.25.109.149
c-sparkle		CNAME	c-sparkle-web
c-sparkle-web		A	69.25.109.173
ca			A	66.211.104.165
call-history		CNAME	ec2-50-16-74-207.compute-1.amazonaws.com.
$TTL 300	; 5 minutes
cgit			CNAME	git
$TTL 3600	; 1 hour
checkin			A	69.25.109.189
checkin-dev		A	172.26.50.2
chef1			A	66.211.104.150
cni-android-dev		A	66.211.104.154
cni-android-reg		A	66.211.104.155
cni-internal-demo	A	66.211.104.172
cni-loadtest		A	69.25.109.57
cni-mpa-dev		CNAME	ec2-67-202-29-109.compute-1.amazonaws.com.
cni-mpa-qa		CNAME	ec2-50-19-77-118.compute-1.amazonaws.com.
cni-sparkle-staging	A	69.25.109.134
cni-staging-web1	A	69.25.109.222
cnidemo			A	66.211.104.221
colo			A	69.25.109.5
vci-event.locationlabs.com A	10.249.0.254
commo			A	66.211.104.171
confluence		CNAME	confluence-prod.engr.wavemarket.com.
confluence-sandbox	CNAME	confluence-sandbox.engr.wavemarket.com.
corpweb			A	66.211.104.153
corpweb-ext		A	66.211.104.134
$TTL 300	; 5 minutes
crashlytics-integration	CNAME	ota
$TTL 3600	; 1 hour
cte-mockkiln		CNAME	cte-mockkiln1.evdc.wavemarket.com.
dav			A	66.211.104.229
DELSLVM328		A	192.168.36.38
DELSLVM908		A	192.168.36.50
DELTMVM022		A	192.168.36.31
DELTMVM023		A	192.168.36.33
DELTMVM024		A	192.168.36.34
DELTMVM025		A	192.168.36.35
demo-t-mobilefamilywhere CNAME	demo.t-mobilefamilywhere.com.
$TTL 300	; 5 minutes
deprecated-tmg-1	A	172.18.99.248
$TTL 3600	; 1 hour
designblog		A	192.168.2.40
$TTL 1200	; 20 minutes
DESKTOP-TEST-CR		A	192.168.13.81
$TTL 3600	; 1 hour
dev-log-gateway		CNAME	kibana-dev1.evdc.wavemarket.com.
developer		CNAME	ds-developer1
developer-db		CNAME	ds-developer-db1
diary-web1		A	66.211.104.158
developer.dmz		A	66.211.104.69
dmz-qa-1		A	66.211.104.231
dmz-qa-2		A	66.211.104.232
dmz-qa-3		A	66.211.104.233
dmz-qa-4		A	66.211.104.234
dmz-qa-5		A	66.211.104.235
dmz-qa-6		A	66.211.104.236
dmz-qa-7		A	66.211.104.237
dmz-qa-8		A	66.211.104.238
dmz-qa-avail		A	66.211.104.230
dna			A	69.25.109.44
docbox			A	172.18.99.243
docker-images		A	66.171.207.20
$TTL 300	; 5 minutes
docs			CNAME	docs.engr.wavemarket.com.
$TTL 600	; 10 minutes
DomainDnsZones		A	172.18.64.2
			A	172.18.64.3
			A	192.168.12.1
			A	192.168.12.2
			AAAA	fdd0:96d4:3d5f:0:184d:80fe:425c:5f8e
			AAAA	fdd0:96d4:3d5f:0:789e:e236:dee6:59d5
$ORIGIN DomainDnsZones.locationlabs.com.
_ldap._tcp.Default-First-Site-Name._sites SRV 0 100 389 hq-ad-1.locationlabs.com.
			SRV	0 100 389 hq-ad-2.locationlabs.com.
_ldap._tcp		SRV	0 100 389 hq-ad-1.locationlabs.com.
			SRV	0 100 389 hq-ad-2.locationlabs.com.
$ORIGIN locationlabs.com.
$TTL 300	; 5 minutes
drivefirst-sprint	A	69.25.109.131
$TTL 3600	; 1 hour
ds-developer		CNAME	ds-developer1.
ds-developer-db		CNAME	ds-developer-db1
ds-developer-db1	CNAME	ec2-184-73-144-103.compute-1.amazonaws.com.
ds-developer1		CNAME	ec2-50-16-139-55.compute-1.amazonaws.com.
ds-geofence		CNAME	ds-geofence1
ds-geofence1		CNAME	ec2-23-20-169-91.compute-1.amazonaws.com.
ds-loadtest		CNAME	ec2-67-202-58-52.compute-1.amazonaws.com.
ds-storage		CNAME	ds-storage1
ds-storage1		CNAME	ec2-72-44-53-115.compute-1.amazonaws.com.
dumitru-vm3		CNAME	dumitru-vm3.engr.wavemarket.com.
dwd-dev			A	69.25.109.48
e			A	66.211.104.166
$ORIGIN e.locationlabs.com.
bounce			A	66.59.91.4
img			CNAME	img.nxr1.com.
lnk			CNAME	lnk.nxr1.com.
reply			A	66.59.91.62
www			CNAME	www.locationlabs.com.
$ORIGIN locationlabs.com.
e-uls-billing1		CNAME	ec2-50-16-60-153.compute-1.amazonaws.com.
e-uls-billing2		CNAME	ec2-75-101-242-95.compute-1.amazonaws.com.
e-uls-dbs		CNAME	ec2-184-73-63-227.compute-1.amazonaws.com.
e-uls-spof		CNAME	ec2-184-72-93-112.compute-1.amazonaws.com.
e-uls-web1		CNAME	ec2-184-73-102-135.compute-1.amazonaws.com.
e-uls-web1s		CNAME	ec2-184-73-102-135.compute-1.amazonaws.com.
e-uls-web2		CNAME	ec2-184-72-164-90.compute-1.amazonaws.com.
e-uls-web2s		CNAME	ec2-184-72-164-90.compute-1.amazonaws.com.
ec2-adminL		CNAME	ec2-50-16-172-7.compute-1.amazonaws.com.
ec2-logger		CNAME	ec2-50-16-172-7.compute-1.amazonaws.com.
ec2-sender		A	184.72.218.68
elephant		A	69.25.109.238
elephant-cte		A	66.211.104.164
elephant-dev		A	66.211.104.186
elephant-gateway	A	69.25.109.203
elephant-stable		A	66.211.104.185
elvs			A	174.129.204.181
email			CNAME	sendgrid.net.
engblog			CNAME	bugz.engr.wavemarket.com.
evan-osx		A	192.168.7.191
evdc			NS	ns1
familybasedemo		A	69.25.109.231
$TTL 300	; 5 minutes
familysafety-sprint	A	66.171.207.217
$TTL 3600	; 1 hour
finder-api		CNAME	finder-api2
finder-api-dev		CNAME	finder-api-dev.evdc.wavemarket.com.
finder-api-qa		A	66.211.104.134
finder-api-stable	CNAME	finder-api-stable.evdc.wavemarket.com.
finder-api-staging	A	66.211.104.137
finder-api2		A	69.25.109.218
fisheye			CNAME	fisheye.evdc.wavemarket.com.
fisheye-sandbox		CNAME	fisheye-sandbox.engr.wavemarket.com.
fmon-db			CNAME	ec2-50-17-9-207.compute-1.amazonaws.com.
fmon-staging		CNAME	fmon-staging-1639010935.us-east-1.elb.amazonaws.com.
fmon-staging1		CNAME	ec2-67-202-20-128.compute-1.amazonaws.com.
fmon-staging2		CNAME	ec2-50-17-23-198.compute-1.amazonaws.com.
fmon-task1		CNAME	ec2-50-17-68-130.compute-1.amazonaws.com.
fmon-task2		CNAME	ec2-50-17-85-5.compute-1.amazonaws.com.
fmon-web		CNAME	fmon-web-1443697443.us-east-1.elb.amazonaws.com.
fmon-web1		CNAME	ec2-50-17-85-6.compute-1.amazonaws.com.
fmon-web2		CNAME	ec2-50-17-37-17.compute-1.amazonaws.com.
$TTL 600	; 10 minutes
ForestDnsZones		A	172.18.64.2
			A	172.18.64.3
			A	192.168.12.1
			A	192.168.12.2
			AAAA	fdd0:96d4:3d5f:0:184d:80fe:425c:5f8e
			AAAA	fdd0:96d4:3d5f:0:789e:e236:dee6:59d5
$ORIGIN ForestDnsZones.locationlabs.com.
_ldap._tcp.Default-First-Site-Name._sites SRV 0 100 389 hq-ad-1.locationlabs.com.
			SRV	0 100 389 hq-ad-2.locationlabs.com.
_ldap._tcp		SRV	0 100 389 hq-ad-1.locationlabs.com.
			SRV	0 100 389 hq-ad-2.locationlabs.com.
$ORIGIN locationlabs.com.
$TTL 3600	; 1 hour
ftabs-mon		A	69.25.109.61
ftabs-web		A	69.25.109.70
fw-web1			A	69.25.109.179
geofence		CNAME	ds-geofence1
geofence-dev		A	69.25.109.126
geofence2		CNAME	ec2-50-17-151-211.compute-1.amazonaws.com.
git			A	172.24.0.92
glitter			CNAME	ec2-50-19-32-184.compute-1.amazonaws.com.
globic-att-finder	CNAME	globic-telefonica
globic-sprint-finder	A	66.211.104.207
globic-telefonica	A	66.211.104.208
globic-tmo-finder	A	66.211.104.138
globic-ubuntu		A	66.211.104.214
graphite-colo		A	69.25.109.57
graphite-colo1		A	69.25.109.57
greeneggs-dev		A	66.211.104.218
greeneggs-stable	A	66.211.104.217
gurgaon-ad-3		A	192.168.36.24
hackday514		A	66.211.104.193
haventef		A	46.51.198.143
hd-sonar		CNAME	hd-sonar.engr.wavemarket.com.
help			CNAME	locationlabs.zendesk.com.
hourglass		A	66.211.104.240
hq-ad			A	172.18.64.2
			A	172.18.64.3
$TTL 300	; 5 minutes
hq-ad-1			A	172.18.64.2
			A	192.168.12.1
			AAAA	fdd0:96d4:3d5f:0:789e:e236:dee6:59d5
hq-ad-2			A	172.18.64.3
			A	192.168.12.2
			AAAA	fdd0:96d4:3d5f:0:184d:80fe:425c:5f8e
$TTL 1200	; 20 minutes
HQ-EDGE-1		A	172.18.99.246
$TTL 3600	; 1 hour
hq-ejabberd-1		A	172.18.99.243
$TTL 1200	; 20 minutes
HQ-EXCHANGE-1		A	172.18.64.15
$TTL 3600	; 1 hour
hq-hd-1			A	192.168.2.36
hq-hd-cree		A	192.168.2.223
hq-hd-dan		A	192.168.2.241
hq-hd-sungil		A	192.168.2.227
hq-ipa			CNAME	hq-ipa.engr.wavemarket.com.
hq-ipa-1		CNAME	hq-ipa-1.engr.wavemarket.com.
hq-ipa-2		CNAME	hq-ipa-2.engr.wavemarket.com.
$TTL 1200	; 20 minutes
hq-sharepoint-1		A	192.168.13.5
$TTL 3600	; 1 hour
hq-splunk-1		A	172.18.64.10
hq-splunkfwd-1		A	172.18.99.245
hq-splunkfwd-2		A	172.18.99.244
$TTL 1200	; 20 minutes
hq-sql-test		A	192.168.13.6
HQ-TMG-1		A	172.18.99.248
hq-wsus-1		A	192.168.13.3
$TTL 300	; 5 minutes
idm			CNAME	ldap-prod-parent.engr.wavemarket.com.
$TTL 0	; 0 seconds
in			NS	ns1
$TTL 3600	; 1 hour
indigo-dev1		A	66.211.104.196
$TTL 300	; 5 minutes
infra-jenkins1		CNAME	infra-jenkins1.engr.wavemarket.com.
$TTL 3600	; 1 hour
interview		CNAME	interview.evdc.wavemarket.com.
inviteafm-dev		A	66.211.104.149
inviteafm-stable	A	66.211.104.195
inviteafm-web1		CNAME	inviteafm-web1.evdc.wavemarket.com.
inviteafm-web2		CNAME	inviteafm-web2.evdc.wavemarket.com.
iphone-callback		A	69.25.109.153
it-bastion		A	66.171.207.254
$TTL 1200	; 20 minutes
it-win			A	192.168.13.4
$TTL 3600	; 1 hour
itr1			CNAME	ec2-184-72-185-233.compute-1.amazonaws.com.
$TTL 1200	; 20 minutes
JAMES2-WIN7		A	192.168.4.168
$TTL 3600	; 1 hour
jenkins			CNAME	jenkins.engr.wavemarket.com.
jenkins-staging		CNAME	jenkins-staging.engr.wavemarket.com.
jira			CNAME	jira.evdc.wavemarket.com.
jira-sandbox		CNAME	jira-sandbox.engr.wavemarket.com.
joescript		A	66.211.104.165
$TTL 1200	; 20 minutes
josh-win7ssd		A	192.168.4.61
$TTL 3600	; 1 hour
kiln-cte		A	66.211.104.206
kiln-cte-services	A	66.211.104.242
kira-vm3		A	66.211.104.151
latest-attfm-automated	CNAME	latest-attfm-automated.evdc.wavemarket.com.
links			A	66.211.104.153
lldemo			CNAME	locationlabsdemo
localhost		A	127.0.0.1
locatephones		CNAME	ota
location-afm		A	66.171.207.156
$TTL 300	; 5 minutes
location-afm-ext	A	66.171.207.145
$TTL 3600	; 1 hour
location-afm-int	CNAME	location-afm-int.afm.sfdc.wavemarket.com.
locationlabsdemo	A	66.211.104.209
$TTL 300	; 5 minutes
log-central-dev1	CNAME	log-central-dev1.evdc.wavemarket.com.
$TTL 3600	; 1 hour
lps-sparkle-callback	A	66.171.207.147
mail			A	66.211.104.167
$TTL 300	; 5 minutes
mailhack		A	192.168.2.195
$TTL 3600	; 1 hour
meego			CNAME	attwp7.wavemarket.com.
meegodemo		A	69.25.109.39
messaging-gateway-dev	CNAME	messaging-gateway-dev.evdc.wavemarket.com.
messaging-gateway-stable A	69.25.109.148
mirage			A	69.25.109.240
mirage-dev		A	69.25.109.239
mirage-stable		A	69.25.109.182
$TTL 300	; 5 minutes
mobilecontrols-sprint	A	66.171.207.220
$TTL 3600	; 1 hour
nagios3			CNAME	vci-lnm-gateway
nearby			A	69.25.109.178
neil-dmz		A	66.211.104.173
new-git			A	66.211.104.230
nortondemo		A	66.211.104.220
nota			CNAME	new-ota
notify			A	69.25.109.185
notify-dev		A	66.211.104.173
notify-lp		A	69.25.109.186
notify-stable		A	172.26.178.254
notify-stable-lp	A	172.26.179.254
notify-staging		A	69.25.109.127
notify-staging-lp	CNAME	notify-staging-lp.sfdc.wavemarket.com.
npmjs			A	192.168.2.139
$TTL 300	; 5 minutes
ns1			A	192.168.2.19
ns2			A	10.39.4.109
$TTL 3600	; 1 hour
nsfv			A	192.168.2.37
old-ota			A	66.211.104.160
openfire-test		CNAME	openfire-test.evdc.wavemarket.com.
openup			A	66.211.104.223
ota			A	66.211.104.165
$TTL 300	; 5 minutes
ott-dev-all		A	66.211.110.40
ott-stable-all		A	66.211.110.18
$TTL 3600	; 1 hour
owncloud		CNAME	owncloud.engr.wavemarket.com.
palmino-staging1	A	66.211.104.252
patterns		A	192.168.2.40
$TTL 300	; 5 minutes
pre-tilden-api-tfw	A	66.171.207.131
pre-web-tfw		A	66.171.207.130
$TTL 3600	; 1 hour
pypi			A	192.168.2.62
pypi-sandbox		CNAME	pypi-sandbox.engr.wavemarket.com.
qablog			CNAME	bugz.engr.wavemarket.com.
qae1			A	184.72.224.141
rabbit			CNAME	ec2-107-21-87-157.compute-1.amazonaws.com.
rat-dev			A	203.196.133.206
receipts		A	69.25.109.121
receipts-db-staging1	CNAME	receipts-db-staging1.evdc.wavemarket.com.
receipts-dev		CNAME	afm-rs-dev1.evdc.wavemarket.com.
receipts-lab		A	69.25.109.195
receipts-stable		A	66.211.104.192
receipts-stable-internal CNAME	receipts-stable-internal.engr.wavemarket.com.
receipts-staging1	CNAME	receipts-staging1.evdc.wavemarket.com.
releasenotes		CNAME	wiki
repo			CNAME	repo.evdc.wavemarket.com.
rockwell-apns-gateway	A	54.183.20.83
ros-staging		CNAME	ros-staging1.evdc.wavemarket.com.
rs-qa-automated		CNAME	rs-qa-automated.evdc.wavemarket.com.
rt			CNAME	sftp
$TTL 300	; 5 minutes
ryuker			A	192.168.2.130
$TTL 3600	; 1 hour
s-v3-db1		CNAME	ec2-72-44-63-118.compute-1.amazonaws.com.
sandbox-confluence	A	192.168.0.239
sandbox-fisheye		CNAME	sandbox-fisheye.engr.wavemarket.com.
sandbox-jenkins		CNAME	sandbox-jenkins.engr.wavemarket.com.
sandbox-jira		CNAME	sandbox.engr.wavemarket.com.
sarah-vm2		CNAME	sarah-vm2.engr.wavemarket.com.
sassy-dev		A	66.211.104.181
sassy-stable		A	66.211.104.145
aci-prod-cdr.sched-cache CNAME	aci-prod-cdr.sched-cache.aci.sfdc.wavemarket.com.
sci-int			A	66.171.207.219
sci-loadtest-int	A	69.25.109.219
sci-loadtest-int2	A	69.25.109.219
sci-staging-int		A	66.211.110.35
sci-staging-web		A	66.211.104.209
sci-web			A	66.171.207.220
sci-web-stable		A	69.25.109.31
sci-web1o		A	69.25.109.194
scribe			CNAME	hq-scribe-1.engr.wavemarket.com.
sdf-android-dev		A	69.25.109.129
sdf-db-test		A	192.168.2.77
sdf-demo		A	69.25.109.135
sdf-int			A	10.249.0.132
sdf-staging-web		A	66.211.104.213
sdf-staging-web1	A	69.25.109.133
sdf-test		A	192.168.2.95
sdf-web			A	69.25.109.131
sdf-web-stable		A	69.25.109.19
			A	69.25.109.33
sdf-web1v		A	69.25.109.132
sdm-test		A	66.211.104.170
server224		A	69.25.109.224
server225		A	69.25.109.225
server226		A	69.25.109.226
server227		A	69.25.109.227
server228		A	69.25.109.228
server229		A	69.25.109.229
server230		A	69.25.109.230
server231		A	69.25.109.231
sfl-api-shim		A	66.171.207.221
sfl-db-test		A	192.168.2.71
sfl-dev-web		CNAME	sfl-dev-web.evdc.wavemarket.com.
sfl-mobile-web-staging	CNAME	sfl-mobile-web-staging.evdc.wavemarket.com.
$TTL 300	; 5 minutes
sfl-pre-api		A	66.171.207.208
$TTL 3600	; 1 hour
sfl-pre-incoming-sms	A	66.171.207.233
$TTL 300	; 5 minutes
sfl-pre-mobile-web	A	66.171.207.209
sfl-pre-retail-web	A	66.171.207.210
sfl-pre-ros		A	66.171.207.211
sfl-pre-shim-api	A	66.171.207.221
sfl-pre-sigur		A	66.171.207.222
$TTL 3600	; 1 hour
sfl-pre-sms-listener	A	66.171.207.223
$TTL 300	; 5 minutes
sfl-pre-sparkle-callback A	66.171.207.214
sfl-pre-wap		A	66.171.207.215
sfl-pre-web		A	66.171.207.216
sfl-sherlock		A	66.171.207.212
$TTL 3600	; 1 hour
sfl-split-staging2	A	69.25.109.244
sfl-split-staging3	A	69.25.109.197
sfl-split-staging4	A	69.25.109.112
sfl-split-staging5	A	69.25.109.250
sfl-split-staging6	A	69.25.109.224
$TTL 300	; 5 minutes
sfl-sprint		A	66.171.207.210
sfl-sprintpcs		A	69.25.109.90
$TTL 3600	; 1 hour
sfl-stable-web		CNAME	sfl-stable-web.evdc.wavemarket.com.
sfl-staging-api-shim	A	66.211.104.208
$TTL 300	; 5 minutes
sfl-staging-sherlock	A	66.171.207.213
$TTL 3600	; 1 hour
sfl-test		A	192.168.2.80
sfl-test-wap		A	69.25.109.251
sfp-db-test		A	192.168.2.78
sfp-dev-ros		CNAME	sfp-dev-ros.evdc.wavemarket.com.
sfp-dev-sigur		CNAME	sfp-dev-sigur.evdc.wavemarket.com.
sfp-dev-tilden		CNAME	sfp-dev-tilden.evdc.wavemarket.com.
sfp-elasticsearch	CNAME	vci-lnm-gateway
sfp-grafana		CNAME	vci-lnm-gateway
sfp-influxdb		CNAME	vci-lnm-gateway
sfp-kafka-offset	CNAME	vci-lnm-gateway
sfp-kibana		CNAME	vci-lnm-gateway
sfp-locator-admin	A	69.25.109.247
sfp-locator-int		CNAME	sfp-locator-int.sfdc.wavemarket.com.
sfp-locator-mobile	A	66.171.207.216
sfp-locator-mobileweb	A	66.171.207.209
sfp-locator-mobileweb-stable A	69.25.109.32
sfp-locator-wap		A	66.171.207.215
sfp-locator-wap-stable	A	69.25.109.28
sfp-locator-web		A	66.171.207.216
sfp-locator-web-stable	A	69.25.109.18
sfp-notify		A	69.25.109.228
sfp-retail-web		A	66.171.207.210
sfp-retail-web-stable	A	69.25.109.29
sfp-sms-listener	A	66.171.207.223
sfp-stable-ros		CNAME	sfp-stable-ros.evdc.wavemarket.com.
sfp-stable-sigur	CNAME	sfp-stable-sigur.evdc.wavemarket.com.
sfp-staging-locator-int	CNAME	sfp-staging-locator-int.evdc.wavemarket.com.
sfp-staging-locator-wap	A	66.211.104.186
sfp-staging-locator-web	A	66.211.104.185
sfp-staging-retail-web	A	66.211.104.177
sfp-staging-ros		A	66.211.104.202
$TTL 300	; 5 minutes
sfp-staging-sherlock	A	66.211.110.15
$TTL 3600	; 1 hour
sfp-staging-sigur	A	66.211.104.203
sfp-test		CNAME	sfp-test.engr.wavemarket.com.
sfp-tilden-nagios	CNAME	vci-lnm-gateway
sftp			A	66.211.104.156
$TTL 300	; 5 minutes
sgb-pre-web		A	66.171.207.217
$TTL 3600	; 1 hour
sgb-staging-web		A	66.211.104.145
sgb-web			A	66.171.207.217
sgp-staging-web		A	66.211.104.145
sigur-dev1		A	66.211.104.194
sigur-stable1		A	66.211.104.224
sigur-staging1		CNAME	sigur-staging1.evdc.wavemarket.com.
sigur1			CNAME	sigur1.evdc.wavemarket.com.
smartlimitsdemo		A	66.171.207.224
smc-db-test		A	192.168.2.74
$TTL 300	; 5 minutes
smc-pre-api		A	66.171.207.218
smc-pre-sparkle-callback A	66.171.207.219
smc-pre-web		A	66.171.207.220
$TTL 3600	; 1 hour
smc-test		A	192.168.2.89
snore			CNAME	sparkle-test
sparkle			CNAME	sparkle-web
sparkle-appdev		A	69.25.109.104
sparkle-appdev-verizon	A	69.25.109.198
sparkle-att		A	69.25.109.236
sparkle-cte		A	66.211.104.219
sparkle-db		CNAME	ec2-75-101-219-19.compute-1.amazonaws.com.
sparkle-db1		CNAME	ec2-174-129-146-20.compute-1.amazonaws.com.
sparkle-db2		CNAME	ec2-75-101-219-19.compute-1.amazonaws.com.
sparkle-dbr		CNAME	ec2-75-101-219-19.compute-1.amazonaws.com.
sparkle-dev		A	66.211.104.184
sparkle-dev-admin	A	172.28.137.10
sparkle-dev-admin-new	A	172.28.137.10
sparkle-dev-att		A	69.25.109.236
sparkle-dev-new		A	66.211.104.184
sparkle-dev-redis	CNAME	sparkle-dev-redis.evdc.wavemarket.com.
sparkle-dev-verizon	A	69.25.109.195
sparkle-elephant	A	66.211.104.187
sparkle-indev		A	203.196.133.204
sparkle-indiadev	A	203.196.133.221
sparkle-instable	A	192.168.36.32
sparkle-intest		A	203.196.133.203
sparkle-intest2		A	203.196.133.205
sparkle-mirage		A	66.211.104.205
sparkle-reports		A	66.211.104.217
			A	69.25.109.184
sparkle-reports-intest	A	203.196.133.202
sparkle-sprint-bsa	A	50.17.235.225
sparkle-stable		A	69.25.109.104
sparkle-stable-internal	CNAME	sparkle-stable-internal.engr.wavemarket.com.
sparkle-staging		CNAME	sparkle-staging-web
sparkle-staging-web	A	69.25.109.174
sparkle-test		A	69.25.109.128
sparkle-tmp		A	69.25.109.237
sparkle-web		A	69.25.109.173
sparkle-web1		CNAME	ec2-50-16-168-6.compute-1.amazonaws.com.
sparkle-web2		CNAME	ec2-50-16-46-18.compute-1.amazonaws.com.
sparkledemo		A	66.211.104.211
sparkledemo2		A	69.25.109.129
sparta1			A	69.25.109.124
splunk			CNAME	hq-splunk-1
sprint-bundle-demo	A	69.25.109.146
sprint-checkin		A	69.25.109.183
sprint-incoming-sms	A	66.171.207.233
sprint-locator-external	A	66.211.104.210
sprint-locator-optimize	A	66.211.104.131
sprint-locator-staging-web1 A	66.211.104.239
sprint-prod-demo1	A	69.25.109.145
sprint-prod-demo2	A	69.25.109.141
sprint-retail-listener	A	66.171.207.223
sprint-retail-staging	A	69.25.109.105
sprint-sms		A	69.25.109.60
sprint-sms-dev		A	66.211.104.143
sprint-sms-stable	A	69.25.109.148
sprint-staging-incoming-sms A	66.211.104.138
sprintmobilecontrols	A	66.211.104.216
sproxy-wap		A	69.25.109.193
sproxy-web		A	69.25.109.192
staging			CNAME	ec2-54-225-48-225.compute-1.amazonaws.com.
stash			CNAME	stash.evdc.wavemarket.com.
statsy			CNAME	hq-hd-1
storage			CNAME	ds-storage1
sfl.support		CNAME	sfl4.zendesk.com.
survey			CNAME	survey.evdc.wavemarket.com.
swan-colo		A	69.25.109.25
tdwd-dev		CNAME	dwd-dev
tdwd-globic		A	69.25.109.27
tdwd-staging		A	69.25.109.59
tdwd-web		A	69.25.109.56
tdwd-web1v		A	69.25.109.115
teleconf		A	66.211.104.159
tequila			A	66.211.104.160
test-automation		CNAME	testautomation-jenkins.engr.wavemarket.com.
test-sfl-mobile		A	69.25.109.18
test-sfl-shim		A	69.25.109.17
testautomation-jenkins	CNAME	testautomation-jenkins.engr.wavemarket.com.
testing			CNAME	ec2-54-225-48-225.compute-1.amazonaws.com.
tft-staging-web		A	69.25.109.159
tft-web			A	69.25.109.58
tft-web1v		A	69.25.109.120
$TTL 300	; 5 minutes
tfw-dev-notify		CNAME	tfw-dev-notify.evdc.wavemarket.com.
tfw-finder-dev		A	66.211.104.243
$TTL 3600	; 1 hour
tfw-lab-sdg		CNAME	viaduct-dev.evdc.wavemarket.com.
tfw-sdg			A	66.171.207.129
$TTL 300	; 5 minutes
tfw-viaduct-dev		CNAME	tfw-viaduct-dev.evdc.wavemarket.com.
tilden-afm-dev		A	66.211.110.26
$TTL 3600	; 1 hour
tilden-afm-dev1		CNAME	tilden-afm-dev1.evdc.wavemarket.com.
tilden-afm-stable	A	66.211.104.155
tilden-afm-stable1	CNAME	tilden-afm-stable1.evdc.wavemarket.com.
tilden-beta-api		A	66.211.104.181
tilden-beta-services	CNAME	tilden-beta-service1.evdc.wavemarket.com.
tilden-dev-api		A	66.211.104.238
tilden-dev-services	CNAME	tilden-dev-service1.evdc.wavemarket.com.
tilden-sfl-dev		CNAME	tilden-sfl-dev-all.evdc.wavemarket.com.
$TTL 300	; 5 minutes
tilden-sfp-staging-all1	CNAME	tilden-sfp-staging-all1.evdc.wavemarket.com.
$TTL 3600	; 1 hour
tilden-ti-stable-all	A	66.211.104.134
tilden-ti-stable-api	A	66.211.110.13
tlf-android-dev		A	66.211.104.174
tlf-billing-test1	CNAME	ec2-46-137-163-131.eu-west-1.compute.amazonaws.com.
tlf-billing-test2	CNAME	ec2-54-247-123-60.eu-west-1.compute.amazonaws.com.
tlf-db			CNAME	ec2-46-51-135-206.eu-west-1.compute.amazonaws.com.
tlf-db1			CNAME	ec2-46-51-135-206.eu-west-1.compute.amazonaws.com.
tlf-db2			CNAME	ec2-79-125-36-241.eu-west-1.compute.amazonaws.com.
tlf-int			CNAME	ec2-46-137-49-70.eu-west-1.compute.amazonaws.com.
tlf-int1		CNAME	ec2-46-137-49-70.eu-west-1.compute.amazonaws.com.
tlf-int2		CNAME	ec2-46-137-28-58.eu-west-1.compute.amazonaws.com.
tlf-sentry		CNAME	ec2-176-34-208-123.eu-west-1.compute.amazonaws.com.
tlf-web			CNAME	tlf-web-1866209191.eu-west-1.elb.amazonaws.com.
tlf-web-staging		A	69.25.109.155
tlf-web-staging2	A	69.25.109.156
tlf-web1		A	176.34.183.213
tlf-web1o		CNAME	ec2-46-137-41-127.eu-west-1.compute.amazonaws.com.
tlf-web2		A	176.34.183.223
$TTL 300	; 5 minutes
tmo-admin		A	69.25.109.217
$TTL 3600	; 1 hour
tmo-android-locator-staging1 A	66.211.104.198
tmo-demo		A	69.25.109.77
tmo-demo1		CNAME	tmo-demo
$TTL 300	; 5 minutes
tmo-stable-core-web	A	66.211.110.19
$TTL 3600	; 1 hour
tmo-stag-cni		A	69.25.109.207
tmo-stag-loc		A	69.25.109.106
TMoClientQA		A	184.72.224.141
$TTL 1200	; 20 minutes
TOMS-W2008S		A	192.168.8.55
$TTL 3600	; 1 hour
tsprint-tracking	A	66.211.104.169
uls-billing		CNAME	e-uls-billing-1963081355.us-east-1.elb.amazonaws.com.
uls-developer-staging	CNAME	uls-webs
uls-staging		CNAME	uls-webs
uls-webs		CNAME	uls-s-lb0-568144184.us-east-1.elb.amazonaws.com.
utest-telefonica	CNAME	ec2-46-137-41-236.eu-west-1.compute.amazonaws.com.
v3-demo			CNAME	ec2-50-16-65-236.compute-1.amazonaws.com.
vci-api-locator		A	69.25.109.143
$TTL 300	; 5 minutes
vci-apns-gateway	A	69.25.109.110
vci-autodeploy		A	172.28.189.1
vci-autodeploy-core	CNAME	vci-autodeploy-core.evdc.wavemarket.com.
vci-autodeploy-docker	A	172.28.189.3
vci-autodeploy-services	A	172.28.189.2
$TTL 3600	; 1 hour
vci-clidor		A	69.25.109.179
vci-core		A	69.25.109.252
vci-core-android-dev1	A	69.25.109.238
vci-core-api		A	69.25.109.252
vci-core-dev1		A	69.25.109.253
vci-core-stats-api	CNAME	vci-lnm-gateway
vci-dev-core		CNAME	vci-dev3
vci-dev-services	CNAME	vci-dev2
vci-dev1		A	66.211.104.147
vci-dev2		A	66.211.104.146
vci-dev3		A	66.211.104.147
$TTL 300	; 5 minutes
vci-elk-gateway		A	69.25.109.145
$TTL 3600	; 1 hour
vci-ext-stable-api-locator A	69.25.109.117
$TTL 300	; 5 minutes
vci-ext-stable-apns-gateway A	69.25.109.109
$TTL 3600	; 1 hour
vci-ext-stable-clidor	A	69.25.109.231
vci-ext-stable-core-api	A	69.25.109.116
vci-ext-stable-fst	CNAME	vci-lnm-gateway
vci-ext-stable-incoming-event-queue A 10.249.0.187
vci-ext-stable-logs	CNAME	vci-lnm-gateway
vci-ext-stable-metrics	CNAME	vci-lnm-gateway
vci-ext-stable-mobile-web A	69.25.109.118
vci-ext-stable-notify	A	69.25.109.190
vci-ext-stable-notify-lp A	69.25.109.158
vci-ext-stable-receipts	A	69.25.109.84
vci-finder-api		A	69.25.109.143
vci-fst			CNAME	vci-lnm-gateway
vci-integration-ub	A	69.25.109.169
vci-lnm-gateway		A	69.25.109.154
$TTL 300	; 5 minutes
vci-lnm-grafana		CNAME	vci-lnm-gateway
$TTL 3600	; 1 hour
vci-lnm-k3		CNAME	vci-lnm-gateway
vci-lnm-logs		CNAME	vci-elk-gateway
vci-lnm-metrics		CNAME	vci-lnm-gateway
vci-lnm-monitoring	CNAME	vci-lnm-gateway
vci-mobile-dev-core	CNAME	vci-mobile-dev-core.evdc.wavemarket.com.
vci-mobile-dev-services	CNAME	vci-mobile-dev-services.evdc.wavemarket.com.
$TTL 300	; 5 minutes
vci-mobile-redir	A	69.25.109.225
$TTL 3600	; 1 hour
vci-mobile-stable-core	A	66.211.104.190
vci-mobile-stable-services CNAME vci-mobile-stable-services.evdc.wavemarket.com.
vci-notify		A	69.25.109.26
vci-pilot-stable-core	A	69.25.109.161
vci-pilot-stable-core-precise A	69.25.109.164
vci-pilot-stable-kiln	A	69.25.109.167
vci-pilot-stable-notify	A	69.25.109.167
vci-receipts		A	69.25.109.83
vci-scale-core-api	CNAME	vci-scale-core-api.evdc.wavemarket.com.
vci-scale-core-api-ext	A	66.211.104.182
vci-scale-hs-query	CNAME	vci-scale-hs-query.evdc.wavemarket.com.
vci-scale-hs-write	CNAME	vci-scale-hs-write.evdc.wavemarket.com.
vci-scale-incoming-event-queue CNAME vci-scale-incoming-event-queue.evdc.wavemarket.com.
vci-scale-seti		CNAME	vc-scale-seti.evdc.wavemarket.com.
vci-scale3-core-api	CNAME	vci-scale3-core-api.evdc.wavemarket.com.
vci-scale3-hs-query	CNAME	vci-scale3-hs-query.evdc.wavemarket.com.
vci-scale3-hs-write	CNAME	vci-scale3-hs-write.evdc.wavemarket.com.
vci-scale3-incoming-event-queue	CNAME vci-scale3-incoming-event-queue.evdc.wavemarket.com.
vci-scale3-seti		A	172.26.133.253
vci-secondary-core-api	A	69.25.109.102
vci-secondary-finder-api A	69.25.109.103
vci-secondary-mobile-web A	69.25.109.105
vci-stable-core		CNAME	vci-stable1
vci-stable-services	CNAME	vci-stable2
vci-stable1		A	66.211.104.135
vci-stable2		A	66.211.104.136
vci-stable3		A	66.211.104.139
vci-various1		A	66.211.104.225
vci-various2		A	66.211.104.183
verizon-sms		A	69.25.109.166
verizon-sms-dev		A	66.211.104.175
verizon-sms-rabbit	CNAME	verizon-sms
verizon-sms-stable	A	69.25.109.198
viaduct-dev		A	66.211.110.11
vitaviola-web		CNAME	vitaviola-web.evdc.wavemarket.com.
$TTL 300	; 5 minutes
vlan66-ssh-gw		A	69.25.109.25
			A	69.25.109.245
$TTL 3600	; 1 hour
vmware-qa		A	192.168.2.11
vzw-db-metrics		A	69.25.109.154
vzw-secondary-sparkle	A	69.25.109.104
vzw-sparkle		A	69.25.109.168
vzwfb-lab-mobile-clients CNAME	vci-ext-stable-clidor
vzwfb-mobile-clients	A	69.25.109.176
wave1			A	66.150.250.162
wave2			A	66.150.250.166
webmail			CNAME	hq-exchange-1
wiki			A	192.168.0.126
wirkle			A	66.211.104.206
wirkle-mw-staging	A	66.211.104.212
wirkle-ubuntu		A	66.211.104.213
www			A	66.211.104.153
