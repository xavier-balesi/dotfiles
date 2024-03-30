COLOR_STD="\e[0m"
COLOR_GRAY="\e[37m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[3;34m"
COLOR_YELLOW="\e[3;33m"
declare -A LOG_LEVELS
export LOG_LEVELS=([TRACE]=0 [DEBUG]=1 [INFO]=2 [WARNING]=3 [ERROR]=4)
export LOG_LEVEL=INFO

function log() {
    local text=${1}
    local label=${2:-INFO}
    local color=${3:-COLOR_STD}
    local time=$(date --rfc-3339=seconds)

    if [[ ${LOG_LEVELS[${label}]} -ge ${LOG_LEVELS[${LOG_LEVEL}]} ]]; then
        echo -e "${time} [${!color}${label}${COLOR_STD}] ${text}"
    fi
}

function logError() { log "${*}" ERROR COLOR_RED; }
function logInfo() { log "${*}" INFO; }
function logWarning() { log "${*}" WARNING COLOR_YELLOW; }
function logDebug() { log "${*}" DEBUG COLOR_BLUE; }
function logTrace() { log "${*}" TRACE COLOR_GRAY; }
