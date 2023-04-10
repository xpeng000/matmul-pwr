#!/bin/bash

SCRIPT_PATH="./record.sh"
timestep=50
id=2	# runs on one V100 instance

bash "$SCRIPT_PATH" $id $timestep > ./data/gpu_pwr_naive_${id}_${timestep}.txt
