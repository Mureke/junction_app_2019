#!/bin/sh


echo "running migrations"
python manage.py migrate

echo "doing collectstatic"
python manage.py collectstatic --noinput

echo "starting supervisord"
supervisord -n -c /etc/supervisor.d/supervisor.ini
