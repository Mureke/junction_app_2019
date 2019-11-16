FROM python:3.7.5-stretch

RUN apt-get update

ENV PYTHONUNBUFFERED 1
ENV work_dir /app
RUN mkdir -p ${work_dir}
WORKDIR ${work_dir}

RUN apt-get install -y  nginx postgresql supervisor binutils libproj-dev gdal-bin
RUN pip install uwsgi

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY deployment/nginx-global.conf /etc/nginx/nginx.conf
COPY deployment/nginx-app.conf /etc/nginx/conf.d/default.conf
COPY deployment/supervisor.ini /etc/supervisor.d/supervisor.ini

EXPOSE 80 443

ADD requirements.txt ${work_dir}

RUN pip install -r requirements.txt

ADD . ${work_dir}

CMD ["/app/deployment/docker_entry.sh"]

