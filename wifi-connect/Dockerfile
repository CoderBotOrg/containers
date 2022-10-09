FROM balenalib/rpi-debian

RUN install_packages dnsmasq wireless-tools

WORKDIR /usr/src/app

ARG VERSION="4.4.7"
RUN curl -Ls "https://github.com/previ/wifi-connect/releases/download/v$VERSION/wifi-connect-v$VERSION-linux-rpi.tar.gz" \
  | tar -xvz -C  /usr/src/app/

COPY scripts/start.sh .

CMD ["bash", "start.sh"]
