#!/bin/bash

export RENOVATE_TOKEN="${RENOVATE_TOKEN}"

date

if [ "$1" == "" ]; then
    echo "Dry run"
    docker run --rm \
      -v "$(pwd)":/usr/src/app \
      -e LOG_LEVEL=debug \
      renovate/renovate:latest \
      --platform=local \
      --dry-run=true
else
    if [ "$1" != "--deploy" ]; then
        echo "Invalid Argument."
    else
        echo "Deploying"
        docker run --rm \
          -v "$(pwd)":/usr/src/app \
          -e RENOVATE_TOKEN="${RENOVATE_TOKEN}" \
          -e LOG_LEVEL=debug \
          renovate/renovate:latest \
          Aiden2244/renovate_sample_repo
    fi
fi
