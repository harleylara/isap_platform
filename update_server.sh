#!/bin/bash

source ./github_accesstoken.txt
git pull "https://$GIT_ACCESS@github.com/kakusuke0605/isap_platform.git" master

./reload.sh