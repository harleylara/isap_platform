#!/bin/bash

while getopts i OPT
    do
        case $OPT in
            i) docker exec -it -u 0 odoo \
                pip3 install pyjwt;;
        esac
    done


docker exec -it -u 0 odoo \
    cp -r /mnt/extra-addons/base/ \
        /mnt/extra-addons/hr_recruitment/ \
        /mnt/extra-addons/website_hr_recruitment/ \
        /mnt/extra-addons/hr/ \
        /mnt/extra-addons/website/ \
        /usr/lib/python3/dist-packages/odoo/addons/
docker stop odoo

while getopts ai OPT
    do
        case $OPT in
            a) docker start -a odoo
               exit 0;;
            i) docker start odoo
               exit 0;;
            *) echo "undefined option (OPT=$OPT)";;
        esac
    done


docker start odoo
