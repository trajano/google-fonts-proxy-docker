FROM httpd:alpine AS httpd
RUN mkdir /cache && chown www-data:www-data /cache
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

FROM caddy:builder AS builder
RUN xcaddy build \
    --with github.com/caddyserver/replace-response \
    --with github.com/caddyserver/cache-handler

FROM caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
