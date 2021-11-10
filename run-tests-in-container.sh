#!/usr/bin/env bash

VENV="/home/circleci/venv3.8"

[ "$(ls -A $VENV/bin/python3.8)" ] || python3.8 -m venv $VENV
$VENV/bin/pip3 install coverage pytest

$VENV/bin/coverage run --parallel-mode --source=/home/circleci/src -m pytest
