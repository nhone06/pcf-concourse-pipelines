#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

find ./om-cli/ -name "om-linux-*" -exec cp '{}' ./om-cli/om-linux  \;
chmod +x om-cli/om-linux
CMD=./om-cli/om-linux

FILE_PATH=`find ./pivnet-product -name *.pivotal`

$CMD -e env/${OPSMAN_ENV_FILE_NAME} upload-product -p $FILE_PATH
