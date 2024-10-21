#!/bin/bash
#
# This script is only for used by docker
# Do not execute manually

main() {
    cd "$(dirname "$0")"
    cd ../

    # run rails server
    if [ "$RAILS_ENV" = "production" ]; then
        export RAILS_SERVE_STATIC_FILES=true
    fi
    bundle exec rails s -b 0.0.0.0 -p 3000 -e "$RAILS_ENV" &

    # get pid of rails server
    pid=$!

    # stop server when receive SIGTERM
    trap 'signal_handler $pid' SIGTERM

    # wait for daemon stopping
    wait
}

signal_handler() {
    echo "Stopping process: pid=$1"
    kill -2 $1
}

main
