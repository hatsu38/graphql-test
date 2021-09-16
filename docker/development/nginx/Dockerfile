FROM nginx:1.21.3

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    locales &&\
    rm -f /etc/localtime &&\
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    echo 'Asia/Tokyo' > /etc/timezone &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

ADD docker/development/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8000