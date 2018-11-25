FROM openresty/openresty:1.13.6.2-alpine-fat

RUN apk add --no-cache \
    openssl \
    openssl-dev

RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-auto-ssl
RUN mkdir -p /etc/resty-auto-ssl
