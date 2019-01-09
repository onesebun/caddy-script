#!/bin/bash
docker rm -f caddy 
docker run -d \
  --name caddy \
  -v /etc/localtime:/etc/localtime:ro \
  -v $PWD/www/:/srv \
  -v $PWD/Caddyfile:/etc/Caddyfile \
  -e "CADDYPATH=/etc/caddycerts" \
  -v $HOME/.caddy:/etc/caddycerts \
  --dns 8.8.8.8 \
  --net="host" \
  abiosoft/caddy

