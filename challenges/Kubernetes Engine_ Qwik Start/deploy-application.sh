#!/bin/bash
printf "Deploying application to GKE Cluster..\n"
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
printf "Application deployed \n"

printf "Creating Kubernetes Service...\n"
kubectl expose deployment hello-server --type=LoadBalancer --port 8080
kubectl get service
printf "Service created and exposed successfully. \n"

printf "Deleting the cluster \n"
gcloud container clusters delete ${GKE_CLUSTER}
printf "Cluster deleted successfully. \n"