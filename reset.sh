#!/bin/bash

export DIR1=$(pwd)
echo $DIR1
docker stop odoo
docker stop db
docker rm odoo db
docker run -d \
    -v isap_platform_odoo-db:/var/lib/postgresql/data \
    -e POSTGRES_USER=odoo \
    -e POSTGRES_PASSWORD=odoo \
    -e POSTGRES_DB=postgres \
    --name db \
    postgres:13
docker run -d \
    -v isap_platform_odoo-data:/var/lib/odoo \
    -v "$DIR1"/addons:/mnt/extra-addons \
    -p 8069:8069 \
    --name odoo \
    --link db:db \
    -t odoo
docker exec -it -u 0 odoo pip3 install pyjwt