#!/bin/sh

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f $RAILS_ROOT/tmp/pids/server.pid
rm -rf $RAILS_ROOT/tmp/cache/*

if [ "${*}" == "./bin/rails server" ]; then
  ./bin/rails db:prepare
fi

# Execute original command
exec "$@"
