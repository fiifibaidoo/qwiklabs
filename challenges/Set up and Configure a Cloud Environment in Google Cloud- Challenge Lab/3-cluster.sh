gcloud beta container clusters create "griffin-dev" --zone "us-east1-b" --machine-type "n1-standard-4" --num-nodes 2 --network=griffin-dev-vpc --subnetwork=griffin-dev-wp

gsutil cp -r gs://cloud-training/gsp321/wp-k8s ~/

cd ~/wp-k8s