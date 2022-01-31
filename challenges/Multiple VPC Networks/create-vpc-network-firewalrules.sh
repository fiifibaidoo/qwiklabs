gcloud compute networks create managementnet --subnet-mode=custom --bgp-routing-mode=regional

gcloud compute networks subnets create managementsubnet-us --range=10.130.0.0/20 --network=managementnet --region=us-central1

gcloud compute networks create privatenet --subnet-mode=custom

gcloud compute networks subnets create privatesubnet-us --network=privatenet --region=us-central1 --range=172.16.0.0/24

gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20

gcloud compute networks list

gcloud compute networks subnets list --sort-by=NETWORK

gcloud beta container clusters create "griffin-dev" --zone "us-east1-b" --machine-type "n1-standard-4" --num-nodes 2 --network=griffin-dev-vpc --subnetwork=griffin-dev-wp