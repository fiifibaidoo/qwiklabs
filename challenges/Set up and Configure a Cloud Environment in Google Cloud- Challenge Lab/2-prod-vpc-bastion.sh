cd dm

gcloud deployment-manager deployments create griffin-prod --config prod-network.yaml

gcloud compute instances create griffin-dev-db --zone=us-east1-b --machine-type=n1-standard-1 --network-interface subnet=griffin-dev-mgmt --network-interface subnet=griffin-prod-mgmt --tags=bastion

gcloud compute firewall-rules create allow-bastion-dev-ssh --direction=INGRESS --priority=1000 --network=griffin-dev-vpc --action=ALLOW --rules=tcp:22 --source-ranges=192.168.32.0/20 --target-tags=bastion

gcloud compute firewall-rules create allow-bastion-prod-ssh --direction=INGRESS --priority=1000 --network=griffin-prod-vpc --action=ALLOW --rules=tcp:22 --source-ranges=192.168.48.0/20 --target-tags=bastion

