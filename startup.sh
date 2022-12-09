#!/bin/bash

export DJANGO_SETTINGS_MODULE=config.settings.production
export DJANGO_DOT_ENV_FILE=.env
export DJANGO_READ_DOT_ENV_FILE=True

# startup worker for the first time to create tables
bash startup_worker.sh

# kill worker
sleep 20
ps axu|grep "safe-transaction" |grep -v 'grep' |awk '{print $2}' |xargs kill -9

# startup web
bash startup_web.sh

# startup worker
echo "==> $(date +%H:%M:%S) ==> startup worker...  <=="
bash startup_worker.sh

# startup scheduler and flow
bash startup_scheduler.sh