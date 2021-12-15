#!/bin/bash

docker start db

while getopts a OPT
    do
        case $OPT in
            a) docker start -a odoo
                exit 0;;
            *) echo "undifined option (OPT=$OPT)";;
        esac
    done

docker start odoo