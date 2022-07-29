#!/usr/bin/env bash

set -e
BASE_DIR="$(dirname ${0})/.."
source "${BASE_DIR}/install_scripts/utils.src"

logDebug "BASE_DIR=$BASE_DIR"

logInfo "Install pip : start"
python3 -m pip install -U pip
logInfo "Install pip : end"

logInfo "Install virtualenv : start"
python3 -m pip install -U virtualenv
logInfo "Install virtualenv : end"

logInfo "Create install virtualenv in ${BASE_DIR}/venv : start"
python3 -m virtualenv venv
logInfo "Create install virtualenv in ${BASE_DIR}/venv : end"

logInfo "Install ansible : start"
python3 -m pip install -U ansible
logInfo "Install ansible : end"
