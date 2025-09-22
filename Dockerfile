FROM ghcr.io/living-tech/alpine-node22:22.19.0

LABEL maintainer="シャトク<system@shatoku.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN npm install -g pnpm@10.17.0
ONBUILD COPY package.json pnpm-lock.yaml ${APP_ROOT}/

ONBUILD RUN pnpm install --frozen-lockfile --no-optional

CMD ["pnpm", "start"]
