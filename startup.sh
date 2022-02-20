#!/usr/bin/env bash

if [ ! -e tmp/pids ]; then
  mkdir -p tmp/pids
fi

bundle exec puma
