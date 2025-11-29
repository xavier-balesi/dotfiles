#!/usr/bin/env bash


function nvidia_property() {
    local property_name=${1:?property_name parameter is mandatory}
    nvidia-smi --query-gpu="${property_name}" --format=csv | tail -1
}

temperature=$(nvidia_property temperature.gpu)
gpu_utilization=$(nvidia_property utilization.gpu | tr -d ' ')

echo GPU: ${temperature}°C - ${gpu_utilization}


