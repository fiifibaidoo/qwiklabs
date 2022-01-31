#!/bin/bash
printf "Fetching authentication for GKE Cluster. \n"
gcloud container clusters get-credentials ${GKE_CLUSTER}
printf "Authentication for GKE Cluster retrieved successfully. \n"