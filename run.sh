#!/bin/sh

eval "$(opam env)"
app/app "$@" || echo "run error code: $?"
