#!/bin/sh

if [ "$REDIS_PASSWORD" != "" ]; then
  echo -e "\n# Secure Redis with a password\nrequirepass $REDIS_PASSWORD" >> /redis/redis.conf
fi

if [ "$REDIS_MAXMEMORY" != "" ]; then
  sed -i -r "s/^(# maxmemory .*)$/\1\nmaxmemory $REDIS_MAXMEMORY/" /redis/redis.conf
fi
