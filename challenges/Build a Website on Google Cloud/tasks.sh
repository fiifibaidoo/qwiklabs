#!/bin/bash
gcloud config set compute/zone us-central1-a

./clone_source.sh
./cloud_build.sh
./create_cluster.sh
./create_microservices.sh