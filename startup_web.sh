#!/bin/bash

export DJANGO_SETTINGS_MODULE=config.settings.production
export DJANGO_DOT_ENV_FILE=.env.tracing.sample
echo "==> $(date +%H:%M:%S) ==> Collecting statics... "
python manage.py collectstatic --noinput

export DJANGO_DOT_ENV_FILE=
export DJANGO_SETTINGS_MODULE=config.settings.production
export DJANGO_SECRET_KEY='Very-secure-secret-string'
export C_FORCE_ROOT=true
export DEBUG=0
export DATABASE_URL=psql://postgres:a~v1LE1aibzw%*456@etmp-test-postgres.cwiv8epvpytp.ap-northeast-1.rds.amazonaws.com:5432/safe_service6
export ETHEREUM_NODE_URL=https://rinkeby.infura.io/v3/4bee79250a3148f3a4f9df00ed6a742b
export ETH_L2_NETWORK=1
export REDIS_URL=redis://etmp-test-redis.c2eqmv.ng.0001.apne1.cache.amazonaws.com:6379/0
export CELERY_BROKER_URL=redis://etmp-test-redis.c2eqmv.ng.0001.apne1.cache.amazonaws.com:6379/0
export CELERY_RESULT_BACKEND=redis://etmp-test-redis.c2eqmv.ng.0001.apne1.cache.amazonaws.com:6379/0

echo "==> $(date +%H:%M:%S) ==> Send via Slack info about service version and network"
python manage.py send_slack_notification

echo "==> $(date +%H:%M:%S) ==> Running Gunicorn..."
gunicorn --config gunicorn.conf.py -b 0.0.0.0:8888 config.wsgi:application