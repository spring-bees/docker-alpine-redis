# REDIS

Docker Run

```
docker run -d \
    --name redis \
    -p 6379:6379 \
    -e REDIS_PASSWORD=mypassword \
    coolbeevip/docker-alpine-redis
```

Docker Compose UP

```yaml
version: '3.2'
services:
  redis:
    image: coolbeevip/docker-alpine-redis
    container_name: redis
    ports:
      - 6379:6379
    environment:
      - REDIS_PASSWORD=mypassword
      - REDIS_MAXMEMORY=41943040
```    

## 参数

* REDIS_PASSWORD 密码，默认空

* REDIS_MAXMEMORY 最大内存，默认 30MB


## Redis Cluster

启动 6个 节点，Redis 端口为 7000-7005, Cluster bus 端口 17000-17005（端口为Redis端口基础上+1000）

```yaml
version: '3.2'
services:
  redis-7000:
    image: coolbeevip/docker-alpine-redis
    container_name: redis-7000
    networks:
      - nc-network
    ports:
      - 7000:6379
      - 17000:16379
    environment:
      - CLUSTER_ANNOUNCE_IP=10.1.57.50
      - CLUSTER_ANNOUNCE_PORT=7000
      - CLUSTER_ANNOUNCE_BUS_PORT=17000
  redis-7001:
    image: coolbeevip/docker-alpine-redis
    container_name: redis-7001
    networks:
      - nc-network
    ports:
      - 7001:6379
      - 17001:16379
    environment:
      - CLUSTER_ANNOUNCE_IP=10.1.57.50
      - CLUSTER_ANNOUNCE_PORT=7001
      - CLUSTER_ANNOUNCE_BUS_PORT=17001
  redis-7002:
    image: coolbeevip/docker-alpine-redis
    container_name: redis-7002
    networks:
      - nc-network
    ports:
      - 7002:6379
      - 17002:16379
    environment:
      - CLUSTER_ANNOUNCE_IP=10.1.57.50
      - CLUSTER_ANNOUNCE_PORT=7002
      - CLUSTER_ANNOUNCE_BUS_PORT=17002
  redis-7003:
    image: coolbeevip/docker-alpine-redis
    container_name: redis-7003
    networks:
      - nc-network
    ports:
      - 7003:6379
      - 17003:16379
    environment:
      - CLUSTER_ANNOUNCE_IP=10.1.57.50
      - CLUSTER_ANNOUNCE_PORT=7003
      - CLUSTER_ANNOUNCE_BUS_PORT=17003
  redis-7004:
    image: coolbeevip/docker-alpine-redis
    container_name: redis-7004
    networks:
      - nc-network
    ports:
      - 7004:6379
      - 17004:16379
    environment:
      - CLUSTER_ANNOUNCE_IP=10.1.57.50
      - CLUSTER_ANNOUNCE_PORT=7004
      - CLUSTER_ANNOUNCE_BUS_PORT=17004
  redis-7005:
    image: coolbeevip/docker-alpine-redis
    container_name: redis-7005
    networks:
      - nc-network
    ports:
      - 7005:6379
      - 17005:16379
    environment:
      - CLUSTER_ANNOUNCE_IP=10.1.57.50
      - CLUSTER_ANNOUNCE_PORT=7005
      - CLUSTER_ANNOUNCE_BUS_PORT=17005
networks:
  nc-network:
    external: true
```

参数

* CLUSTER_ANNOUNCE_IP 映射到集群的地址

* CLUSTER_ANNOUNCE_PORT 映射到集群的端口

* CLUSTER_ANNOUNCE_BUS_PORT 映射到集群的总线端口

登录任意节点，执行以下命令，根据提示自动创建 3 个 master 和 3 个 slave 节点

```
redis-cli --cluster create 10.1.57.50:7000 10.1.57.50:7001 10.1.57.50:7002 10.1.57.50:7003 10.1.57.50:7004 10.1.57.50:7005 --cluster-replicas 1
```
