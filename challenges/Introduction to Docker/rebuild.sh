#!/bin/bash
printf "Rebuilding with tag 0.2 and run another container with the new version...\n"
docker build -t node-app:0.2 .
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker ps
printf "Completed successfully"

printf "Testing the containers...\n"
curl http://localhost:8080
curl http://localhost:4000
printf "Completed successfully.\n"