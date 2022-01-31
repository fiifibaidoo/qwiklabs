#!/bin/bash
printf "Initializing PROJECT_ID..."
export PROJECT_ID=$(gcloud info --format='value(config.project)')

printf "PROJECT_ID initialized successfully. \n"

printf "Running hello world container to get started..."
. hello-world.sh
printf "Completed successfully"

printf "Building a Docker image that's based on a simple node application..."
. build.sh
printf "Completed successfully"

printf "Running containers..."
cd ~
. run-containers.sh
printf "Completed successfully"