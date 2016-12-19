# mesos-dns

[![Build Status](https://travis-ci.org/katosys/mesos-dns.svg?branch=master)](https://travis-ci.org/katosys/mesos-dns)

A containerized Mesos DNS service:

```
docker run -it --rm \
--env MDNS_ZK=zk://quorum-1:2181,quorum-2:2181,quorum-3:2181/mesos \
--env MDNS_REFRESHSECONDS=60 \
--env MDNS_TTL=60 \
--env MDNS_DOMAIN=mesos \
--env MDNS_PORT=53 \
--env MDNS_RESOLVERS=8.8.8.8 \
--env MDNS_TIMEOUT=5 \
--env MDNS_HTTPON=true \
--env MDNS_DNSON=true \
--env MDNS_HTTPPORT=8123 \
--env MDNS_EXTERNALON=true \
--env MDNS_LISTENER=0.0.0.0 \
--env MDNS_SOAMNAME=ns1.mesos \
--env MDNS_SOARNAME=root.ns1.mesos \
--env MDNS_SOAREFRESH=60 \
--env MDNS_SOARETRY=600 \
--env MDNS_SOAEXPIRE=86400 \
--env MDNS_SOAMINTTL=60 \
--env MDNS_IPSOURCE=netinfo,mesos,host \
katosys/mesos-dns:v0.6.0-2 -v 2
```
