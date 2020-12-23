FROM alpine

RUN apk add --no-cache avahi chrony

ADD entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
