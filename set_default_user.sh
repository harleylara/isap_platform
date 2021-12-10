#!/bin/bash

docker cp ./sqls/set_default_user.sql db:/root
docker exec -it -u 0 db psql -f /root/set_default_user.sql -U odoo test_database