#!/bin/bash

CONTAINER_IMAGE="gm8136_build"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [[ "$(sudo docker images -q ${CONTAINER_IMAGE} 2>/dev/null)" == "" ]]; then
    sudo docker build -t "${CONTAINER_IMAGE}" "${SCRIPTPATH}"
fi
sudo docker run -i -v "${SCRIPTPATH}":/env/src --detach=false --rm --tty=true "$CONTAINER_IMAGE" /bin/bash -c 'make -C /env/src/ all'

