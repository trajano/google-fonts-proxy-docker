FROM httpd:alpine AS httpd
RUN mkdir /cache && chown www-data:www-data /cache
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

FROM caddy:builder AS builder
RUN xcaddy build \
    --with github.com/caddyserver/replace-response \
    --with github.com/caddyserver/cache-handler

FROM busybox:1.36.1-uclibc
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
HEALTHCHECK --start-period=10s --start-interval=1s CMD wget -q --spider http://localhost/ || exit 1
CMD [ "/usr/bin/caddy", "run", "--config", "/etc/caddy/Caddyfile" ]
