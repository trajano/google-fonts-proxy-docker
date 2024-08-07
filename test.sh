#!/bin/bash
set -ex
image_name=$(docker build . -q)
MSYS_NO_PATHCONV=1 docker run -v $(pwd):/mnt $image_name caddy validate --config /mnt/Caddyfile
MSYS_NO_PATHCONV=1 docker run -v $(pwd):/mnt $image_name caddy fmt --overwrite /mnt/Caddyfile
if [ -n "$1" ]; then
    PORT=$1
else
    PORT=$RANDOM
fi
container_name=$(docker run --rm -q -p $PORT:80 --env "STATIC_URL=http://localhost:$PORT/s"  -d $image_name)
while [ "$(docker inspect --format='{{.State.Health.Status}}' $container_name)" != "healthy" ]; do
  sleep 1
done
curl -v 'localhost:'$PORT'/'
curl -v 'localhost:'$PORT'/css?family=Roboto:300,400,400i,700,700i&display=swap'
curl -v -o/dev/null 'localhost:'$PORT'/npm/jquery@3.6.4/dist/jquery.min.js'
curl -v -o/dev/null 'localhost:'$PORT'/ajax/libs/jqueryui/1.13.3/jquery-ui.min.js'
curl -v 'localhost:'$PORT'/debug'
