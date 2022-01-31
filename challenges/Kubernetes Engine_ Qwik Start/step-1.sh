#!/bin/bash
printf "Initializing default zone and PROJECT_ID..."
export PROJECT_ID=$(gcloud info --format='value(config.project)')
export GKE_CLUSTER=qwikstart-cluster
gcloud config set compute/zone us-central1-a
printf "Initialized successfully. \n"

printf "Create a GKE Cluster. \n"
. create-cluster.sh

printf "Get authentication credentials for the cluster \n."
. get-auth.sh

printf "Deploy an application to the cluster"
. deploy-application.sh
