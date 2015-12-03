#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM alpine:3.2

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

ENV MESOS_DNS_VERSION="v0.5.1" \
    DOWNLOAD_URL="https://github.com/mesosphere/mesos-dns/releases/download"

#------------------------------------------------------------------------------
# Install Mesos DNS
#------------------------------------------------------------------------------

RUN apk add --update openssl bash \
    && wget ${DOWNLOAD_URL}/${MESOS_DNS_VERSION}/mesos-dns-${MESOS_DNS_VERSION}-linux-amd64 -O /bin/mesos-dns \
    && chmod +x /bin/mesos-dns \
    && apk del --purge openssl \
    && rm -rf /tmp/* /var/cache/apk/*

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------

EXPOSE 53
ENTRYPOINT ["/init"]
