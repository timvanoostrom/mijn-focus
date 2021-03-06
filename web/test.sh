#!/usr/bin/env bash

set -u # crash on missing env
set -e # stop on any error

echo "Running style checks"
flake8

echo "Running coverage tests"
export COVERAGE_FILE=/tmp/.coverage
coverage erase
coverage run -m unittest
coverage report --include=./focus/*.py --fail-under=79
