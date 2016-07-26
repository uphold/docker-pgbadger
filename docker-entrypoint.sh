#!/bin/sh
set -e

if [ "$1" != "pgbadger" ]; then
  set -- pgbadger "$@"
fi

mkdir -p "$PGBADGER_DATA"

set -- "$@" --jobs $(nproc) --outdir "$PGBADGER_DATA"

echo "$@"
exec "$@"
