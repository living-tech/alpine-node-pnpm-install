FROM ghcr.io/living-tech/alpine-node22:22.15.0

LABEL maintainer="シャトク<system@shatoku.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm@8.12.1
ONBUILD COPY package.json pnpm-lock.yaml ${APP_ROOT}/

ONBUILD RUN pnpm install --frozen-lockfile --no-optional

CMD ["pnpm", "start"]
