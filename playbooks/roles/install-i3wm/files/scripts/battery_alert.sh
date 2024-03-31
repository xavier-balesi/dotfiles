#!/usr/bin/env bash

# watch battery level and send notification if it's lowerthan a threshold

set -eu

get_battery_level() {
    acpi -b | grep -oE '[[:digit:]]+%' | tr -d '%' | tr -d $'\n'
}

battery_alert() {
    local threshold="${1}"
    local battery_level=$(get_battery_level)

    if [ "${battery_level}" -le "${threshold}" ]; then
        notify-send -u critical Battery "Battery level is LOW \!\!\! (${battery_level}\%)"
    fi
}

watch_battery() {
    local threshold="${1:-10}"
    local time_sleep="${2:-20}"
    while true; do
        battery_alert "${threshold}"
        sleep ${time_sleep}
    done
}

watch_battery $@
