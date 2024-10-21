#!/bin/bash

cd $(dirname $0)
cd ../

echo "Warning:"
echo "Current credentials.yml.enc will delete and recreate."
echo "If you save secret data into this file, you must rewrite it."

echo -n "Are you sure to continue? [y/N]"
read res
if ! [ "$res" == "y" ] && ! [ "$res" == "Y" ]; then
    echo "Aborted"
    exit 1
fi

echo "Reset credentials.yml.enc and master.key"
rm -f config/master.key
rm -f config/credentials.yml.enc
if docker run -it --rm \
    -v $PWD:/app \
    ruby:3.0.0 bash -c "cd /app && bundle install && \
    EDITOR=true bundle exec rails credentials:edit && \
    chown -R $(id -u):$(id -g) /app"
then
    rm -rf tmp/cache
    echo "Done"
else
    echo "Failed to reset master.key"
    exit 1
fi
