FROM nginx:1.23.1-alpine

ADD dist /usr/share/nginx/html
ADD cb_docs /usr/share/nginx/html/docs
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf