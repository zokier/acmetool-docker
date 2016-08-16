FROM openresty/openresty:centos-rpm

COPY nginx.conf /usr/local/openresty/nginx/conf/
COPY main.conf acme.conf /usr/local/openresty/nginx/conf/conf.d/
COPY acme.htpasswd /usr/local/openresty/nginx/conf/

EXPOSE 80 443 9080

# RUN openssl dhparam -out /usr/local/openresty/nginx/conf/dhparam.pem 2048
