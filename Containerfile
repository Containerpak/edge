FROM ubuntu:26.04 AS source

ADD --checksum=sha256:38161c8c49dc88f1dc1c9797d78a63064611e1490b8c2ca290afa0677027ef8b \
    https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_151.0.4129.78-1_amd64.deb \
    /tmp/edge.deb

FROM ghcr.io/containerpak/gtk:main

COPY --from=source /tmp/edge.deb /tmp/edge.deb

RUN apt update && \
    apt install -y --no-install-recommends /tmp/edge.deb && \
    rm /tmp/edge.deb && \
    cpak-clean-junk
