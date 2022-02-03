# Google Fonts Proxy

This is a drop in replacement for Google Fonts requests so that the source IP of a calling service will not be sent to Google to avoid [fines in the EU](https://www.theregister.com/2022/01/31/website_fine_google_fonts_gdpr/)

It's an Apache HTTPd server running mod_proxy which forwards to Google and subsitutes the responses so that references to google are replaced with the request of this server.

Note this *does not* support URL prefixing nor SSL.  So you need to route on `/s` and `/css` as needed using Traefik.

It also uses the proxy cache to reduce the requests to Google.

## Testing locally

docker rm -f fp ; docker build . -t f && docker run --rm --name fp -p 4000:80 -d f
curl -v 'localhost:4000/css?family=Roboto:300,400,400i,700,700i&display=swap'