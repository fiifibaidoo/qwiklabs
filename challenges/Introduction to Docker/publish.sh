#!/bin/bash
printf "Publishing image to gcr... \n"
docker tag node-app:0.2 gcr.io/${PROJECT_ID}/node-app:0.2
docker images
docker push gcr.io/${PROJECT_ID}/node-app:0.2
printf "Completed successfully.\n"

printf "Removing all containers for a fresh environment... \n"
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi node-app:0.2 gcr.io/${PROJECT_ID}/node-app node-app:0.1
docker rmi node:6
docker rmi $(docker images -aq) # remove remaining images
docker images
printf "Completed successfully.\n"

printf "Pulling image to start a pseudo-fresh environment... \n"
docker pull gcr.io/[project-id]/node-app:0.2
docker run -p 4000:80 -d gcr.io/${PROJECT_ID}/node-app:0.2
curl http://localhost:4000
printf "Completed successfully.\n"