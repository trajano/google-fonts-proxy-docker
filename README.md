# Google Fonts Proxy

Google Fonts Proxy is a drop-in replacement for direct Google Fonts requests. This proxy server ensures that the source IP of the requesting service is not exposed to Google, helping you avoid [GDPR-related fines in the EU](https://www.theregister.com/2022/01/31/website_fine_google_fonts_gdpr/).

This project supports both Apache HTTPd and Caddy servers, depending on the Docker label used.

### Apache HTTPd
In the Apache HTTPd server, `mod_proxy` is utilized to forward requests to Google. The server then substitutes the response to replace any Google references with those of this server.

### Caddy
For Caddy, a modified version is used that leverages the following plugins:
* `github.com/caddyserver/caddy/v2` (via `github.com/trajano/caddy/v2@otel-client`)
* `github.com/caddyserver/replace-response`
* `github.com/caddyserver/cache-handler`

Caddy also employs a proxy cache to minimize requests to Google. However, it uses a simple disk cache, so ensure adequate storage is available to handle potential DoS attacks.

> **Note:** This proxy does *not* support URL prefixing or SSL. Ensure you route `/s` and `/css` through your SSL termination server (e.g., Traefik or Caddy).

## Labels

The proxy comes in two variants:

1. **`httpd`** - Supports `X-Forwarded-*` headers for automatic determination.
2. **`caddy`** - Supports only the `STATIC_URL` environment variable.

## Usage

```yaml
service:
  fonts:
    image: trajano/google-fonts
```

## Build test locally

### Build and Run
```bash
docker rm -f fp ; docker build . -t f && docker run --rm --name fp -p 4000:80 -d f
curl -v 'localhost:4000/css?family=Roboto:300,400,400i,700,700i&display=swap'
```

### Test with Environment Variable

```bash
docker rm -f fp ; docker build . -t f && docker run --rm --name fp -p 4000:80 --env STATIC_URL=http://localhost:4000/s -d f
curl -v 'localhost:4000/css?family=Roboto:300,400,400i,700,700i&display=swap'
```
