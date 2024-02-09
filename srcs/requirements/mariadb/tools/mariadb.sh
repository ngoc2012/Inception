#!/bin/bash

envsubst < /usr/local/bin/init.sql > /tmp/init.sql.tmp && mv /tmp/init.sql.tmp /usr/local/bin/init.sql

exec "$@"