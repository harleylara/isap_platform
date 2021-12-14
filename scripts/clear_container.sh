#!/bin/bash

docker stop odoo
docker stop db
docker rm odoo db
