#!/bin/bash

if nc -w 5 -z localhost 5432; then
    echo 'There is already some process listening on port 5432.'
    echo 'Please shutdown any existing PostgreSQL instance and re-run this script.'
    exit 1
fi

export PGHOST=localhost
export PGUSER=postgres
export PGPASSWORD=postgres
export PGDATABASE=local_zmon_db

PGVERSION=9.4.5

container=$(docker ps | grep postgres:$PGVERSION)
if [ -z "$container" ]; then
    docker rm postgres
    echo 'Starting PostgreSQL instance..'
    docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:$PGVERSION
fi

until nc -w 5 -z localhost 5432; do
    echo 'Waiting for Postgres port..'
    sleep 3
done

sleep 5

echo 'Running tests..'
./mvnw clean verify -Pintegration-test

echo 'Stopping PostgreSQL instance..'
docker stop postgres
