FROM ghcr.io/living-tech/alpine-node18:18.17.1

LABEL maintainer="シャトク<system@shatoku.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm@8.12.1
ONBUILD COPY .npmrc package.json pnpm-lock.yaml .pnpmfile.cjs ${APP_ROOT}/

ONBUILD RUN pnpm install --frozen-lockfile --ignore-optional

CMD ["pnpm", "start"]