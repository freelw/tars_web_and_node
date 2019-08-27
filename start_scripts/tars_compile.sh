#!/bin/bash

sudo docker run --rm --net=host -e TARS_MODULE_NAME=${1} -v `pwd`:/share freelw/tars_compile:latest
