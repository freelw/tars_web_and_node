#!/bin/bash

source ./config
source ./dumpinfo
sudo docker run -d --rm --name tars_web --env DBIP=${DBIP} --env DUMP_HOST=${DUMP_HOST} --net=host -v `pwd`:/share -v /usr/share/zoneinfo/:/usr/share/zoneinfo/ freelw/tars_web_develop
