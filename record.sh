#!/bin/bash

script_event() {
        echo -n "# $1 @"
        echo $(date "+%F-%T.%3N-%Z")
}

id=$1
timestep=$2
buffer_time=3
file_path=./data/naive_${id}_${timestep}.txt

echo "recording GPU power consumption on id $id with time interval $timestep msec"
start_time=$(date "+%s")

nvidia-smi --query-gpu=timestamp,power.draw --format=csv,noheader,nounits --id=$id --loop-ms=$timestep & s=$!

script_event "start recording GPU power"
sleep $buffer_time
script_event "start train"
#run code here > $file_path 2>&1
script_event "end train"
sleep $buffer_time
script_event "recording stops"

kill $s