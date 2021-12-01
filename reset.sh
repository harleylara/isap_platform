#!/bin/bash

export DIR1=$(pwd)
echo $DIR1
docker stop odoo
docker stop db
docker rm odoo db
docker run -d \
    -e POSTGRES_USER=odoo \
    -e POSTGRES_PASSWORD=odoo \
    -e POSTGRES_DB=postgres \
    --name db \
    postgres:13
docker run -v "$DIR1"/addons:/mnt/extra-addons \
    -p 8069:8069 \
    --name odoo \
    --link db:db \
    -t odoo
