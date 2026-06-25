FROM ghcr.io/living-tech/alpine-node22:22

LABEL maintainer="シャトク<system@shatoku.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN npm install -g pnpm@11.7.0

CMD ["pnpm", "start"]
