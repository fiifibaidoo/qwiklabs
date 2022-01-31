#!/bin/bash
printf "Running hello-world docker..."
docker run hello-world
docker images
printf "Completed successfully..."

printf "Pulling latest version of hello-world docker..."
docker images
printf "Completed successfully..."

printf "Looking at the running containers..."
docker ps
docker ps -a
printf "Completed successfully..."