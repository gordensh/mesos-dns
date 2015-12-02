#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM alpine

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

ENV MESOS_DNS_VERSION 0.5.1
ENV DOWNLOAD_URL "https://github.com/mesosphere/mesos-dns/releases/download"

#------------------------------------------------------------------------------
# Install Mesos DNS
#------------------------------------------------------------------------------

RUN apk update && \
    apk add openssl && \
    wget ${DOWNLOAD_URL}/v${MESOS_DNS_VERSION}/mesos-dns-v${MESOS_DNS_VERSION}-linux-amd64 \
    -O /bin/mesos-dns && \
    chmod +x /bin/mesos-dns && \
    apk del openssl

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------

EXPOSE 53
ENTRYPOINT ["/bin/mesos-dns"]
