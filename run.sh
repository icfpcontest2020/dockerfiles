#!/bin/sh

app/app "$@" || echo "run error code: $?"
