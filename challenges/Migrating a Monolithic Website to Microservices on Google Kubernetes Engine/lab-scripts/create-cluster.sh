#!/bin/bash

printf "Enabling Container APIs..."
gcloud services enable container.googleapis.com > /dev/null 2>&1
printf "Completed.\n"

printf "Creating GKE Clusters..."
gcloud container clusters create fancy-cluster --num-nodes 3 > /dev/null 2>&1
printf "Completed.\n"

