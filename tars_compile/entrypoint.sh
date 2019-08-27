#!/bin/bash

source /root/.nvm/nvm.sh && cd /share/ && nvm use v8.10.0 && tars-deploy ${TARS_MODULE_NAME}
