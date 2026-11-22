FROM ghcr.io/living-tech/alpine-node24:24.22.3

LABEL maintainer="シャトク<system@shatoku.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN apk upgrade --no-cache && apk add --no-cache curl
RUN npm install -g pnpm@11.28.8

CMD ["pnpm", "start"]
