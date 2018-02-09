FROM alpine:3.7

# install bash and setting as defaul shell to root
RUN  apk --update --no-cache add bash \
    && sed -r 's/\/bin\/ash/\/bin\/bash/' /etc/passwd > /dev/null

# docker entrypoint
COPY docker-entrypoint.sh /

# setting entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
