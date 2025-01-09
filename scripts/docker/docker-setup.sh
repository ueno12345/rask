#!/bin/bash

# This scirpt is only for used by scripts/setup-docker.sh
# Do not execute manually

sudo apt-get update && sudo apt-get install -y sqlite3

echo
echo "Migrating production database"
if ! bundle exec rails db:migrate RAILS_ENV="production"; then
    echo
    echo "Error:"
    echo "    Failed to migrate production database"
    exit 1
fi

echo
echo "Migrating development database"
if ! bundle exec rails db:migrate RAILS_ENV="development"; then
    echo
    echo "Error:"
    echo "    Failed to migrate development database"
    exit 1
fi

if [ "$(sqlite3 db/production.sqlite3 "SELECT * FROM task_states;" | wc -l)" != "3" ]; then
    echo
    echo "Inserting initial data into production database"
    if ! bundle exec rails db:seed RAILS_ENV="production"; then
        echo
        echo "Error:"
        echo "    Failed to insert initial data into production database"
        exit 1
    fi
fi

if [ "$(sqlite3 db/development.sqlite3 "SELECT * FROM task_states;" | wc -l)" != "3" ]; then
    echo
    echo "Inserting initial data into development database"
    if ! bundle exec rails db:seed RAILS_ENV="development"; then
        echo
        echo "Error:"
        echo "    Failed to insert initial data into development database"
        exit 1
    fi
fi
