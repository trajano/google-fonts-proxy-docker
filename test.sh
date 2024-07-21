#!/bin/bash
PORT=$RANDOM
docker rm -f fp ; docker build . -t f && docker run --rm --name fp -p $PORT:80 --env "STATIC_URL=http://localhost:$PORT/s"  -d f
curl -v 'localhost:'$PORT'/'
sleep 1
curl -v 'localhost:'$PORT'/css?family=Roboto:300,400,400i,700,700i&display=swap'
