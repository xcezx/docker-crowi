FROM node:4.7-alpine

ARG CROWI_VERSION
ENV CROWI_VERSION $CROWI_VERSION
ENV NODE_ENV production

WORKDIR /usr/src/crowi
RUN apk add --no-cache --virtual .build-dep \
        curl \
        g++ \
        git \
        make \
        python \
        tar \
    && curl -SL https://github.com/crowi/crowi/archive/v${CROWI_VERSION}.tar.gz | tar -xz -C . --strip-components 1 \
    && npm install -g npm@3.x \
    && npm install --production --unsafe-perm \
    && npm cache clean \
    && apk del .build-dep \
    && rm -rf /tmp/npm* \
    && chown node:node -R /usr/src/crowi

EXPOSE 3000

USER node
CMD ["npm", "start"]
