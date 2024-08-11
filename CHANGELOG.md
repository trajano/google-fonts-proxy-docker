# 1.2.2
* Remove cookies from the header
* On Caddy, `/npm` routes to cdn.jsdelivr.net
* On Caddy, `/ajax` routes to ajax.googleapis.com

# 1.2.1

* On Caddy, if `OTEL_EXPORTER_OTLP_ENDPOINT` is set then OpenTelemetry tracing will be enabled.  Note this may cause you GDPR issues so use it only if you need it.

# 1.2.0

* Provided a Caddy version rather than Apache Httpd.  However this only supports `STATIC_URL` and does not support using `X-Forwarded-*` for the lookup.

# 1.1.4

* [Remove Link header which is sends with preconnect from server](https://github.com/trajano/google-fonts-proxy-docker/pull/2)

# 1.1.3

* Support STATIC_URL to allow mapping without relying on request variables.  Note this replaces https://fonts.gstatic.com/s (including the /s so if you replace it you have to add the /s as well.  See README for the example.)

# 1.1.2

* Support /icon path

# 1.1.1

* Removed debug logging

# 1.1.0

* Support /css2 path
* Use `FilterChain`
* Explicitly remove headers that may be added by Traefik
* Set `IncludesNOEXEC` just in case.
