#!/bin/bash

# Set environment
gcloud config set compute/zone us-east1-b

printf "Enabling Container APIs..."
gcloud services enable container.googleapis.com > /dev/null 2>&1
printf "Completed.\n"

printf "Creating GKE Clusters..."
gcloud container clusters create create nucleus-webserver1
gcloud container clusters get-credentials nucleus-webserver1
kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0
kubectl expose deployment hello-app --type=LoadBalancer --port 8080
kubectl get service
printf "Completed.\n"
