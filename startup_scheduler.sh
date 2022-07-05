#!/bin/bash

export RUN_MIGRATIONS=1
export WORKER_QUEUES="default,indexing"
echo "==> $(date +%H:%M:%S) ==> startup scheduler...  <=="
nohup bash docker/web/celery/scheduler/run.sh >scheduler_output.log 2>&1 &

echo "==> $(date +%H:%M:%S) ==> startup flower...  <=="
nohup bash docker/web/celery/flower/run.sh >scheduler_output.log 2>&1 &