#!/usr/bin/env bash

set -e

COLOR_STD="\e[0m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[3;34m"
COLOR_YELLOW="\e[3;33m"


function log() {
    local text=${1}
    local label=${2:-INFO}
    local color=${3:-COLOR_STD}
    local time=$(date --rfc-3339=seconds)

    echo -e "${time} [${!color}${label}${COLOR_STD}] ${text}"
}


function logError() { log "${*}" ERROR COLOR_RED; }
function logInfo() { log "${*}" INFO; }
function logWarning() { log "${*}" WARNING COLOR_YELLOW; }
function logDebug() { log "${*}" DEBUG COLOR_BLUE; }

function cpLog() {
  local source="${1}"
  local dest="${2}"
  local force="${3:-false}"
  
  option="--no-clobber"
  if [ -f "${dest}" ]; then
    if [[ "${force}" == true ]]; then
      logInfo "Destination file ${dest} exists, override !"
      option="--force"
    else
      logWarning "Destination file ${dest} exists, use force mode to override."
    fi
  fi
  cp ${option} "${source}" "${dest}"
}

BASE_DIR="$(dirname ${0})"
logDebug "BASE_DIR=${BASE_DIR}" 

cpLog "${BASE_DIR}/.vimrc" "${HOME}/.vimrc" "${FORCE}"
