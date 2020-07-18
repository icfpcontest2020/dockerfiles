#!/bin/bash

# Just replace contents with
# exec $your_binary $your_extra_flags "$@"

exec /bin/echo `cat /data/greeting.txt` and "$@"
