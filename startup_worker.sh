#!/bin/bash

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

export RUN_MIGRATIONS=1
export WORKER_QUEUES="default,indexing"
bash docker/web/celery/worker/run.sh

export WORKER_QUEUES="contracts,tokens"
bash docker/web/celery/worker/run.sh

export WORKER_QUEUES="notifications,webhooks"
bash docker/web/celery/worker/run.sh