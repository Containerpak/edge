FROM ubuntu:26.04 AS source

ADD --checksum=sha256:38161c8c49dc88f1dc1c9797d78a63064611e1490b8c2ca290afa0677027ef8b \
    https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_151.0.4129.78-1_amd64.deb \
    /tmp/edge.deb

FROM ghcr.io/containerpak/gtk3:main

RUN --mount=type=bind,from=source,source=/tmp/edge.deb,target=/run/edge.deb \
    apt-get update && \
    apt-get install -y /run/edge.deb && \
    cpak-clean-junk
