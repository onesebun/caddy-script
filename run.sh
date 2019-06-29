#!/bin/bash
docker rm -f caddy
docker run -d \
  --name caddy \
  -v /etc/localtime:/etc/localtime:ro \
  -v $(pwd)/www/:/srv \
  -v $(pwd)/Caddyfile:/etc/Caddyfile \
  -v $(pwd)/.caddy:/root/.caddy \
  -v $(pwd)/logs/:/var/tmp \
  --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  17/caddy
