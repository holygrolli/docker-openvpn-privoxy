FROM alpine:3.18.2

ARG BUILD_RFC3339="1970-01-01T00:00:00Z"
ARG COMMIT
ARG VERSION

STOPSIGNAL SIGKILL

LABEL org.opencontainers.image.ref.name="holygrolli/openvpn-privoxy" \
      org.opencontainers.image.created=$BUILD_RFC3339 \
      org.opencontainers.image.authors="holygrolli" \
      org.opencontainers.image.documentation="https://github.com/holygrolli/docker-openvpn-privoxy/blob/master/README.md" \
      org.opencontainers.image.description="OpenVPN Client in a Docker Container" \
      org.opencontainers.image.licenses="GPLv3" \
      org.opencontainers.image.source="https://github.com/holygrolli/docker-openvpn-privoxy" \
      org.opencontainers.image.revision=$COMMIT \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.url="https://github.com/holygrolli/docker-openvpn-privoxy/"

VOLUME ["/vpn"]
VOLUME ["/privoxy"]
EXPOSE 8118
COPY entrypoint.sh /
RUN apk add --no-cache openvpn=2.6.5-r0 privoxy=3.0.34-r2 tini=0.19.0-r1 bash=5.2.15-r5 && \
      chmod +x /entrypoint.sh
ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
