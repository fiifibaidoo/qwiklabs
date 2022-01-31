#!/bin/bash

# Setup the environment
gcloud config set compute/zone us-central1-f

# Clone Source Repository
cd ~
git clone https://github.com/googlecodelabs/monolith-to-microservices.git
cd ~/monolith-to-microservices
./setup.sh

# Deploy Existing Monolith
cd ~/lab-scripts
./create-cluster.sh
./deploy-monolith.sh