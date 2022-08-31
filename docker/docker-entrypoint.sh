#!/bin/bash
set -e

if [ "$ENABLE_INTERCEPTOR" = 'yes' ]; then
  echo 'Starting interceptord'
  interceptord.py &
fi

if [ "$ENABLE_DLR_THROWER" = 'yes' ]; then
  echo 'Starting DLR thrower'
  dlrd.py &
fi

if [ "$ENABLE_DLR_LOOKUP" = 'yes' ]; then
  echo 'Starting DLR lookup'
  dlrlookupd.py &
fi

if [ "$ENABLE_DELIVER_THROWER" = 'yes' ]; then
  echo 'Starting DLR SM thrower'
  dlrsmd.py &
fi

echo "$@"
echo 'Starting jasmind'
exec "$@"
