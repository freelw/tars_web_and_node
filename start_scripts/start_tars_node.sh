#!/bin/bash

source ./config
source ./dumpinfo
sudo nvidia-docker run -d --rm --name tars_node --env DBIP=${DBIP} --env DUMP_HOST=${DUMP_HOST} --net=host -v `pwd`:/share tars_node
