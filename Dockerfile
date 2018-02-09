FROM alpine

# docker entrypoint
ADD docker-entrypoint.sh /

# setting entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
