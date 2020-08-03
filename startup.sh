#!/bin/sh

if [ ! -d /redis/data ]; then
    mkdir -p /redis/data
fi

# 判断环境比变量中集群模式是否打开
if [ $REDIS_CLUSTER_NAME ]; then
    echo REDIS_CLUSTER_NAME = $REDIS_CLUSTER_NAME

    if [ ! -f "/redis/redis.conf" ]; then
        cp /tmp/redis.conf /redis/redis.conf
    fi

    sed -i "s/cluster-enabled no/cluster-enabled yes/g" /redis/redis.conf
    sed -i "s/port 6379/port $REDIS_CLUSTER_NAME/g" /redis/redis.conf
else
    if [ ! -f "/redis/redis.conf" ]; then
        cp /tmp/redis.conf /redis/redis.conf
    fi
    sed -i "s/cluster-enabled yes/cluster-enabled no/g" /redis/redis.conf
fi

exec redis-server /redis/redis.conf
