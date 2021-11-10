#!/usr/bin/env bash

# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

IMG="circleci/python:3.8"
docker pull $IMG

WORK_DIR="-w /home/circleci/src/"
BIND_DIR="-v $DIR:/home/circleci/src"
VENV_DIR="--mount source=pyvenv3.8,target=/home/circleci/venv3.8"
OPTIONS="$WORK_DIR $BIND_DIR $VENV_DIR"

CMD="/home/circleci/src/run-tests-in-container.sh"
docker run --user="root:root" -it --rm $OPTIONS $IMG $CMD
