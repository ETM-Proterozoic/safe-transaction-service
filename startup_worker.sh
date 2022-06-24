#!/bin/bash

export DJANGO_SETTINGS_MODULE=config.settings.production

export RUN_MIGRATIONS=1
export WORKER_QUEUES="default,indexing"
nohup bash docker/web/celery/worker/run.sh >worker_output.log 2>&1 &

export WORKER_QUEUES="contracts,tokens"
nohup bash docker/web/celery/worker/run.sh >worker_output.log 2>&1 &

export WORKER_QUEUES="notifications,webhooks"
nohup bash docker/web/celery/worker/run.sh >worker_output.log 2>&1 &