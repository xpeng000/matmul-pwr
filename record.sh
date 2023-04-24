#!/bin/bash

script_event() {
        echo -n "# $1 @"
        echo $(date "+%F-%T.%3N-%Z")
}

id=0
timestep=50
buffer_time=3

nvcc matmul.cu -o mm

echo "recording GPU power consumption on id $id with time interval $timestep msec"
start_time=$(date "+%s")

nvidia-smi --query-gpu=timestamp,power.draw --format=csv,noheader,nounits --id=$id --loop-ms=$timestep & s=$!

script_event "start recording GPU power"
sleep $buffer_time
script_event "start train"
./mm
script_event "end train"
sleep $buffer_time
script_event "recording stops"

kill $s
