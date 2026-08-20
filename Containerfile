FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/edge"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates fonts-liberation libcups2t64 libcurl4t64 \
    libnss3 libvulkan1 wget xdg-utils && \
    cpak-clean-junk
