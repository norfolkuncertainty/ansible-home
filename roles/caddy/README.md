# Caddy Role

## Build

podman run --rm -it -v $(pwd)/roles/caddy/files:/tmp/caddy  docker.io/caddy:2.9.1-builder xcaddy build --with github.com/caddy-dns/porkbun --output /tmp/caddy