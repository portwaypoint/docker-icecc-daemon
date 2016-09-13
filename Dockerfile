FROM alpine:3.4

RUN apk --no-cache add libcap-ng lzo libstdc++ && \
    apk --no-cache add --virtual .bdeps alpine-sdk git automake autoconf libtool libcap-ng-dev lzo-dev && \
    git clone https://github.com/icecc/icecream && \
    (cd icecream && autoreconf -i && ./configure --without-man && make && make install) && \
    rm -rf icecream && \
    apk del .bdeps

# Run icecc daemon in verbose mode
ENTRYPOINT ["iceccd","-v"]
# If no-args passed, make very verbose
CMD ["-vv"]

# iceccd port
EXPOSE 10245 8765/TCP 8765/UDP 8766
