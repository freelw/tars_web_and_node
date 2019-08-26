#!/bin/bash

source ./config
source ./dumpinfo
sudo docker run -d --rm --name tars_web --env DBIP=${DBIP} --env DUMP_HOST=${DUMP_HOST} --net=host --network=host -v `pwd`:/share freelw/tars_web_develop
