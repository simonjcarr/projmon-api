# Builds nextjs app and copies it to Caddy server using npm

FROM node:12.18.3-alpine3.12 AS builder

WORKDIR /app

ADD . /app

RUN npm install

RUN npm run build

FROM caddy:alpine

COPY --from=builder /app/build /srv

COPY Caddyfile /etc/caddy/Caddyfile




