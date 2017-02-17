# docker-crowi

[![Build Status](https://travis-ci.org/xcezx/docker-crowi.svg?branch=master)](https://travis-ci.org/xcezx/docker-crowi)

## Usage

```yml
# docker-compose.yml
version: "2"
services:
  crowi:
    image: xcezx/crowi:1.5.3
    environment:
      MONGO_URI: mongodb://mongo/crowi
      REDIS_URL: redis://redis:6379/crowi
      ELASTICSEARCH_URI: http://es:9200/crowi
      PASSWORD_SEED: blahblahblah
    ports:
      - 3000:3000
    depends_on:
      - mongo
      - redis
      - es
  mongo:
    image: mongo:3.4
  redis:
    image: redis:3.2-alpine
  es:
    image: elasticsearch:2.4-alpine
```
