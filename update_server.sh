#!/bin/bash

source ./github_accesstoken.txt
git pull "https://$GIT_ACCESS@github.com/kakusuke0605/isap_platform.git" master

docker exec -it -u 0 odoo \
    cp -r /mnt/extra-addons/base/ \
        /mnt/extra-addons/hr_recruitment/ \
        /mnt/extra-addons/website_hr_recruitment/ \
        /mnt/extra-addons/hr/ \
        /mnt/extra-addons/website/ \
        /usr/lib/python3/dist-packages/odoo/addons/
docker stop odoo
docker start odoo