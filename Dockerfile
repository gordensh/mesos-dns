#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM alpine:3.2

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

ENV MDNS_VERSION="0.5.1" \
    KVIATOR_VERSION="0.0.5" \
    MDNS_URL="https://github.com/mesosphere/mesos-dns/releases/download" \
    KVIATOR_URL="https://github.com/AcalephStorage/kviator/releases/download"

#------------------------------------------------------------------------------
# Install Mesos DNS and KViator
#------------------------------------------------------------------------------

RUN apk add --update -t deps openssl unzip \
    && apk add --update bash curl \
    && wget ${MDNS_URL}/v${MDNS_VERSION}/mesos-dns-v${MDNS_VERSION}-linux-amd64 -O /bin/mesos-dns \
    && wget ${KVIATOR_URL}/v${KVIATOR_VERSION}/kviator-${KVIATOR_VERSION}-linux-amd64.zip \
    && unzip -d /bin kviator-${KVIATOR_VERSION}-linux-amd64.zip \
    && chmod +x /bin/mesos-dns \
    && apk del --purge deps \
    && rm -rf /kviator-${KVIATOR_VERSION}-linux-amd64.zip /tmp/* /var/cache/apk/*

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------

EXPOSE 53
ENTRYPOINT ["/init"]
