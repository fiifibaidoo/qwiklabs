gcloud compute instances create lamp-1-vm --zone=us-central1-a --machine-type=n1-standard-2

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server