#!/bin/bash

docker exec -it -u 0 odoo \
    cp -r /mnt/extra-addons/base/ \
        /mnt/extra-addons/hr_recruitment/ \
        /mnt/extra-addons/website_hr_recruitment/ \
        /mnt/extra-addons/hr/ \
        /mnt/extra-addons/website/ \
        /usr/lib/python3/dist-packages/odoo/addons/
docker cp ./config/config.py odoo:/mnt/extra-addons/s2u_online_appointment/controllers/
docker stop odoo

while getopts a OPT
    do
        case $OPT in
            a) docker start -a odoo
               exit 0;;
            *) echo "undefined option (OPT=$OPT)";;
        esac
    done


docker start odoo
