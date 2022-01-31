#!/bin/bash
printf "Creating a GKE Cluster qwik-start. \n"
gcloud container clusters create ${GKE_CLUSTER}
printf "Created a GKE Cluster. \n"