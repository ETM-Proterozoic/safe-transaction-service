#!/bin/bash

set -euo pipefail

echo "==> $(date +%H:%M:%S) ==> Running Celery flower <=="
exec celery -C -A config.celery_app flower --address=0.0.0.0 --port=5554