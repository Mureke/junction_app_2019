FROM mhart/alpine-node:10
MAINTAINER markus.suomalainen@gmail.com

ENV work_dir /var/www
WORKDIR ${work_dir}

RUN apk --update add nginx

ADD package.json ${work_dir}

RUN npm install

COPY deployment/nginx.conf /etc/nginx/nginx.conf

ADD . ${work_dir}
ARG ENV=production
RUN node_modules/.bin/ng build --configuration=$ENV --prod

CMD ["/var/www/docker_entry.sh"]