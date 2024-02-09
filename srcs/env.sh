#!/bin/bash

if [[ -e ".env" ]]; then
    exit 0
else
    echo "File srcs/.env does not exists"
    exit 1
fi