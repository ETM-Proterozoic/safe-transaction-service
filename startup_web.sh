#!/bin/bash

export DJANGO_SETTINGS_MODULE=config.settings.production
export DJANGO_DOT_ENV_FILE=.env.tracing.sample
echo "==> $(date +%H:%M:%S) ==> Collecting statics... "
python manage.py collectstatic --noinput

export DJANGO_DOT_ENV_FILE=

echo "==> $(date +%H:%M:%S) ==> Send via Slack info about service version and network"
python manage.py send_slack_notification

echo "==> $(date +%H:%M:%S) ==> Running Gunicorn..."
gunicorn --config gunicorn.conf.py -b 0.0.0.0:8888 config.wsgi:application -D