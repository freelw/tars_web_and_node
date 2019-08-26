#!/bin/bash

source ./config
source ./dumpinfo
sudo nvidia-docker run -d -it --rm --name tars_web --env DBIP=${DBIP} --env DUMP_HOST=${DUMP_HOST} --net=host -v `pwd`:/share tars_web_develop:v1.1
