# docker-mesos-dns

[![Build Status](https://travis-ci.org/h0tbird/docker-mesos-dns.svg?branch=master)](https://travis-ci.org/h0tbird/docker-mesos-dns)

A containerized Mesos DNS service. It is possible to publish the service IP to `etcd`, `consul` or `zookeeper`:

```
docker run -it --rm \
--env MDNS_ZK=zk://core-1:2181,core-5:2181,core-9:2181/mesos \
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
--env MDNS_IPSOURCE_1=netinfo \
--env MDNS_IPSOURCE_2=mesos \
--env MDNS_IPSOURCE_3=host \
--env KV_TYPE=etcd \
--env KV_IP=127.0.0.1 \
--env KV_PORT=2379 \
--env KV_PATH=/mesos/dns \
h0tbird/mesos-dns -v 2
```
