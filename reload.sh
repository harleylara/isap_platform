#!/bin/bash

docker exec -it -u 0 odoo \
    pip3 install pyjwt
docker exec -it -u 0 odoo \
    cp -r /mnt/extra-addons/base/ \
        /mnt/extra-addons/hr_recruitment/ \
        /mnt/extra-addons/website_hr_recruitment/ \
        /mnt/extra-addons/hr/ \
        /usr/lib/python3/dist-packages/odoo/addons/
docker stop odoo
docker start odoo -a
