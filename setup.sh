#!/bin/bash
export DIR1=$(pwd)
echo $DIR1
docker run \
    -e POSTGRES_USER=odoo \
    -e POSTGRES_PASSWORD=odoo \
    -e POSTGRES_DB=postgres \
    --name db \
    postgres:13
docker run -d -v "$DIR1"/addons:/mnt/extra-addons \
    -p 8069:8069 \
    --name odoo \
    --link db:db \
    -t odoo