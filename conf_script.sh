#!/bin/sh

if [ "$REDIS_PASSWORD" != "" ]; then
  echo "init redis password"
  echo -e "\nrequirepass $REDIS_PASSWORD" >> /redis/redis.conf
fi

if [ "$REDIS_MAXMEMORY" != "" ]; then
  echo "init redis maxmemory"
  sed -i -r "s/^(# maxmemory .*)$/\1\nmaxmemory $REDIS_MAXMEMORY/" /redis/redis.conf
fi

if [ "$REDIS_MAXMEMORY" != "" ]; then
  echo "init redis port"
  sed -i -r "s/^(# port .*)$/\1\port $REDIS_PORT/" /redis/redis.conf
fi
