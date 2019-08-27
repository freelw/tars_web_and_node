#!/bin/bash

cmd='source /root/.nvm/nvm.sh && cd /share/ && tars-deploy '${1}
echo $cmd

cmd1='docker run --rm --net=host -v '`pwd`':/share freelw/tars_compile:latest bash -c "'$cmd'"'
echo $cmd1
echo $cmd1 | bash
