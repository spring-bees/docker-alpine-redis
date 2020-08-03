
FROM redis:5.0.7-alpine

MAINTAINER coolbeevip(coolbeevip@gmail.com)

ENV TZ=Asia/Shanghai

COPY docker-entrypoint.sh /usr/local/bin/

COPY redis.conf /tmp/redis.conf

COPY startup.sh /startup.sh

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  chmod +x /usr/local/bin/docker-entrypoint.sh && \
  chmod +x /startup.sh && \
  mkdir -p /redis && chown redis:redis /redis

WORKDIR /redis

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 33060

CMD ["/startup.sh"]
