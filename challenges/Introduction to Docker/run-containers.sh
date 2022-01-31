#!/bin/bash
printf "Running node-app container"
docker run -p 4000:80 --name my-app node-app:0.1
printf "Completed successfully"

printf "Running container in the background"
docker stop my-app && docker rm my-app
docker run -p 4000:80 --name my-app -d node-app:0.1
docker ps
printf "Completed successfully"