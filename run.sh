#!/bin/bash
docker rm -f caddy
docker run -d --name caddy \
  -v /etc/localtime:/etc/localtime:ro \
  -p 80:80 -p 443:443 \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  -v $PWD/site:/srv \
  -v $PWD/caddy_data:/data \
  -v $PWD/log/access.log:/var/log/access.log \
  --restart=unless-stopped \
  caddy
