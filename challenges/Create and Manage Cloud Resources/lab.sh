#!/bin/bash

# Setup the environment
# Uses the default environment and region

cd ~/lab-scripts
./create-insance.sh
./create-cluster.sh
./setup-http-load-balancer.sh