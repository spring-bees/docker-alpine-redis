# REDIS


docker run \
    --name redis \
    -p 6379:6379 \
    -e REDIS_PASSWORD=mypassword \
    coolbeevip/docker-alpine-redis


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

REDIS_PASSWORD 密码，默认空

REDIS_MAXMEMORY 最大内存，默认 30MB
