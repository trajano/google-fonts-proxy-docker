#!/bin/bash
MSYS_NO_PATHCONV=1 command docker run -v $(pwd):/mnt caddy caddy fmt --overwrite /mnt/Caddyfile