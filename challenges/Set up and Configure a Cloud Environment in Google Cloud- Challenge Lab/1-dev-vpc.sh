gcloud compute networks create griffin-dev-vpc --subnet-mode=custom

gcloud compute networks subnets create griffin-dev-wp --range=192.168.16.0/20 --network=griffin-dev-vpc --region=us-east1

gcloud compute networks subnets create griffin-dev-mgmt --range=192.168.32.0/20 --network=griffin-dev-vpc --region=us-east1

gsutil cp -r gs://cloud-training/gsp321/dm ~/

cd dm